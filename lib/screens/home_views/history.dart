import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/chart.dart';
import 'package:flutter_app/components/custom_card.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            CustomCard(
              title: "Monthly Overview",
              subtitle: "Your Carbon footprint",
              color: AppColor.cardGreen,
              child: Chart(),
            ),
          ]
        ),
      ),
    );
  }
}
