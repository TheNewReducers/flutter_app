import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/chart.dart';
import 'package:flutter_app/components/custom_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
