import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/components/chart.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/components/custom_image_card.dart';
import 'package:flutter_app/components/view_title_bar.dart';
import 'package:flutter_app/components/title_bar.dart';
import 'package:flutter_app/services/navigation_service.dart';
import 'package:flutter_app/components/CustomPieChart.dart';

import '../../components/card_slider.dart';


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
                    title: "Monthly Overview",
                    subtitle: "Your Carbon footprint",
                    color: AppColor.cardGreen,
                    child: const Chart(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 14, right: 14, bottom: 24),
                  child: CustomCard(
                    shareable: true,
                    title: "Monthly Overview",
                    subtitle: "Your Carbon footprint in kg",
                    color: AppColor.cardGreen,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, left: 0, right: 0, bottom: 24),
                      child: data.isEmpty ? Container(height: 300, child: const Center(child: Text("No Data"))) : CustomPieChart(data: data),
                    ),
                  ),
                ),
                TitleBar(title: "Tipps to reduce carbon emissions", onMorePressed: _showAllTipps, xPadding: 18),
                const CardSlider(
                  initialPadding: 14,
                  children: [
                    CustomImageCard(image: AssetImage("assets/images/chicken.png"), title: "Test", color: AppColor.cardGreen),
                    CustomImageCard(image: AssetImage("assets/images/chicken.png"), title: "Test", color: AppColor.cardGreen),
                    CustomImageCard(image: AssetImage("assets/images/chicken.png"), title: "Test", color: AppColor.cardGreen),
                  ]
                ),
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
