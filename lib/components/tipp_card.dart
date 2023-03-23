import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/custom_image_card.dart';
import 'package:flutter_app/models/reduce_carbon_tipp.dart';

class TippCard extends StatelessWidget {
  TippCard({super.key, required this.tipp});

  final ReduceCarbonTipp tipp;

  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomImageCard(image: AssetImage(tipp.imagePath), title: tipp.title, color: AppColor.cardGreen);
  }
}