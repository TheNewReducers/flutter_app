import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/components/chart.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/components/tipp_card.dart';
import 'package:flutter_app/components/view_title_bar.dart';
import 'package:flutter_app/components/title_bar.dart';
import 'package:flutter_app/models/receipt.dart';
import 'package:flutter_app/services/navigation_service.dart';
import 'package:flutter_app/components/custom_pie_chart.dart';

import '../../components/card_slider.dart';
import '../../constants/tipps.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

// final Directory imageDir = Directory("assets/imagesTips");
// final List<String> imagePaths = imageDir.listSync().map((file) => file.path).toList();

  void _showAllTipps() {
    NavigationService.instance.pushNamed("/tipps");
  }

  List<Receipt> dataMapAmount() {
    List<Receipt> receiptList = [];
    for (var receipt in AppState.receipts) {
      receiptList.add(receipt);
      if (receiptList.length >= 5) break;
    }
    return receiptList;
  }

  Map<String, double> dataMap() {
    Map<String, double> dataMap = {};
    for (var receipt in AppState.receipts) {
      for (var i = 0; i < receipt.items.length; i++) {
        double base = dataMap[receipt.items[i].category] ?? 0;
        dataMap[receipt.items[i].category] = base + receipt.items[i].carbon;
      }
    }
    return dataMap;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: AppState.receiptsStream,
        initialData: AppState.receipts,
        builder: (context, snapshot) {
          final data = dataMap();
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ViewTitleBar(title: "Dashboard", xPadding: 18),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 24),
                  child: CustomCard(
                    shareable: true,
                    title: "Recent progress",
                    subtitle: "Your carbon footprint",
                    color: AppColor.cardGreen,
                    child: Chart(
                      data: dataMapAmount(),
                    ),
                  ),
                ).animate()
                  .slideY(duration: const Duration(milliseconds: 700), begin: 0.12, end: 0, curve: Curves.easeInOut)
                  .fadeIn(duration: const Duration(milliseconds: 700), curve: Curves.easeInOut),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 14, right: 14, bottom: 24),
                  child: CustomCard(
                    shareable: true,
                    title: "Monthly Overview",
                    subtitle: "Your carbon footprint distribution",
                    color: AppColor.cardGreen,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, left: 0, right: 0, bottom: 24),
                      child: data.isEmpty ? const SizedBox(height: 300, child: Center(child: Text("No Data"))) : CustomPieChart(data: data),
                    ),
                  ),
                ).animate()
                  .slideY(duration: const Duration(milliseconds: 700), begin: 0.12, end: 0, curve: Curves.easeInOut)
                  .fadeIn(duration: const Duration(milliseconds: 700), curve: Curves.easeInOut),
                TitleBar(title: "Tipps to reduce carbon emissions", onMorePressed: _showAllTipps, xPadding: 18),
                CardSlider(
                  initialPadding: 14,
                  children: [
                    ...constantsTipps.map((t) => TippCard(tipp: t)).toList(),
                  ]
                ).animate()
                  .slideY(duration: const Duration(milliseconds: 700), begin: 0.12, end: 0, curve: Curves.easeInOut)
                  .fadeIn(duration: const Duration(milliseconds: 700), curve: Curves.easeInOut),
                // ListView.builder(
                //       itemCount: imagePaths.length,
                //       itemBuilder: (BuildContext context, int index) {
                //         return CustomImageCard(
                //           image: AssetImage(imagePaths[index]),
                //           title: "Test",
                //           color: AppColor.cardGreen,
                //         );
                //       },
                // ),
                const SizedBox(height: 40),
              ],
            ),
          );
        }
      ),
    );
  }





}
