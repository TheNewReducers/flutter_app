import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/components/chart.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/components/history_item.dart';
import 'package:flutter_app/components/view_title_bar.dart';
import 'package:flutter_app/models/receipt.dart';
import 'package:flutter_app/models/receipt_item.dart';
import 'package:flutter_app/services/navigation_service.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  void onItemTap(Receipt receipt) {
    NavigationService.instance.pushNamed("/details", arguments: receipt);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ViewTitleBar(title: "History", xPadding: 18),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: ListView.builder(
                itemCount: AppState.receipts.length,
                itemBuilder: (context, index) {
                  final item = AppState.receipts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: InkWell(
                      onTap: () => onItemTap(item),
                      child: HistoryItem(receipt: item, color: AppColor.cardGreen),
                    )
                  );
                }
              ),
            )
          )
        ],
      )
    );
  }
}
