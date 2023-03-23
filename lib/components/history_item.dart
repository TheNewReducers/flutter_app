import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.carbon, required this.title, required this.color, required this.createdAt});

  final double carbon;
  final String title;
  final DateTime createdAt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      height: 87,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 7),
              Text(createdAt.toString(), style: const TextStyle(fontSize: 15, color: AppColor.grey)),
            ],
          ),
          Row(
            children: [
              Text(carbon.toStringAsPrecision(1) + "kg", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              const Text("CO", style: TextStyle(fontSize: 18)),
              const Padding(
                padding: EdgeInsets.only(top: 9),
                child: Text("2"),
              )
            ],
          )
        ],
      ),
    );
  }
}