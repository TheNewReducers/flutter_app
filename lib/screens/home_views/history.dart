import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/chart.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/components/history_item.dart';
import 'package:flutter_app/components/view_title_bar.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: HistoryItem(carbon: 2.3, title: "Rewe Innsbruck", color: AppColor.cardGreen, createdAt: DateTime.now()),
                ),
              )
            )
          )
        ],
      )
    );
  }
}
