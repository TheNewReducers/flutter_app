import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/custom_card.dart';

class AvgCarbonFootprintCard extends StatelessWidget {
  const AvgCarbonFootprintCard({super.key, required this.value});

  final double value;
  final double avgSwitzerland = 83.7; // https://ourworldindata.org/co2/country/switzerland#per-capita-how-much-co2-does-the-average-person-emit

  double maxPercentage() {
      return 100 / max(value, avgSwitzerland);
  }

  double getPercentage(double val) {
    return val * maxPercentage();
  }

  Color getColor(double val) {
    if (val == max(value, avgSwitzerland)) {
      return AppColor.yellow;
    } else {
      return AppColor.normalGreen;
    }
  }

  Widget bar(String title, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FractionallySizedBox(
          widthFactor: getPercentage(value) / 100,
          alignment: FractionalOffset.center,
          child: Container(
            height: 12,
            decoration: BoxDecoration(
              color: getColor(value),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("${value.toStringAsFixed(1)} kg", style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
        const SizedBox(height: 18)
      ],
    );
  }

  int carDistance() {
    return (value * 5).round();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: "Monthly average emissions",
      subtitle: "Your average carbon footprint",
      color: AppColor.cardGreen,
      shareable: true,
      child: Column(
        children: [
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value.toStringAsFixed(1), style: const TextStyle(fontSize: 54, fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              const Text("kg", style: TextStyle(fontSize: 32)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 32),
            child: Column(
              children: [
                bar("You", 65.4),
                bar("Avg Switzerland", avgSwitzerland),
                Row(
                  children: const [
                    Text("Your friends (soon)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38)),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    const Icon(Icons.car_crash_rounded, color: Colors.black87),
                    const SizedBox(width: 12),
                    Text("Driving ${carDistance()}km in a petrol car emits the same", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}