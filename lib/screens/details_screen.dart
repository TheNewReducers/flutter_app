import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/CustomPieChart.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/components/history_item.dart';
import 'package:flutter_app/models/receipt.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.receipt});

  final Receipt receipt;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.receipt.title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 2),
            Text(widget.receipt.formattedCreatedAt, style: const TextStyle(fontSize: 15, color: AppColor.grey)),
          ],
        ),
        elevation: 0,
        backgroundColor: AppColor.cardGreen,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 42),
            CustomPieChart(),
            SizedBox(height: 42),
            Padding(
              padding: EdgeInsets.only(top: 0, left: 14, right: 14, bottom: 24),
              child: CustomCard(
                title: "Receipt Details",
                subtitle: "Carbon details of the receipt items",
                color: AppColor.cardGreen,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Column(
                    children: [
                      ...widget.receipt.items.map((item) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.title, style: TextStyle(fontSize: 16)),
                          Text(item.carbon.toStringAsPrecision(1) + "kg CO2", style: TextStyle(fontSize: 16)),
                        ],
                      )).toList(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        decoration: const BoxDecoration(
                          color: Colors.black54
                        ),
                        height: 1,
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sum", style: TextStyle(fontSize: 16)),
                          Text(widget.receipt.totalCarbon.toStringAsPrecision(1) + "kg CO2", style: TextStyle(fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}
