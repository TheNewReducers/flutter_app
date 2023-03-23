import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/card_slider.dart';
import 'package:flutter_app/components/chart.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/components/custom_image_card.dart';
import 'package:flutter_app/components/title_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 24),
            child: CustomCard(
              title: "Monthly Overview",
              subtitle: "Your Carbon footprint",
              color: AppColor.cardGreen,
              child: Chart(),
            ),
          ),
          TitleBar(title: "Tips for better health", onMorePressed: () => print("See more"), xPadding: 18),
          const CardSlider(
            initialPadding: 14,
            children: [
              CustomImageCard(image: AssetImage("assets/images/chicken.png"), title: "Test", color: AppColor.cardGreen),
              CustomImageCard(image: AssetImage("assets/images/chicken.png"), title: "Test", color: AppColor.cardGreen),
              CustomImageCard(image: AssetImage("assets/images/chicken.png"), title: "Test", color: AppColor.cardGreen),
            ]
          ),
        ],
      ),
    );
  }
}
