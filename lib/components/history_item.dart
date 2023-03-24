import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/models/receipt.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.receipt, required this.color});

  final Receipt receipt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(child: Container(
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
              Text(receipt.title, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 7),
              Text(receipt.formattedCreatedAt, style: const TextStyle(fontSize: 15, color: AppColor.grey)),
            ],
          ),
          Row(
            children: [
              Text("${receipt.totalCarbon.toStringAsFixed(1)} kg", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
    ));
  }
}