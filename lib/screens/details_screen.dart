import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/components/custom_pie_chart.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/models/receipt.dart';
import 'package:flutter_app/models/receipt_item.dart';
import 'package:flutter_app/services/navigation_service.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.receipt});

  final Receipt receipt;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  Map<String, double> dataMap() {
    Map<String, double> dataMap = {};
    for (var i = 0; i < widget.receipt.items.length; i++) {
      double base = dataMap[widget.receipt.items[i].category] ?? 0;
      dataMap[widget.receipt.items[i].category] = base + widget.receipt.items[i].carbon;
    }
    return dataMap;
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete receipt"),
          content: const Text("Are you sure you want to delete this receipt?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                AppState.removeReceipt(widget.receipt);
                Navigator.of(context).pop();
                NavigationService.instance.pushNamed("/", arguments: 2);
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      }
    );
  }

  void showInfo(String info) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Info"),
          content: Text(info),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      }
    );
  }

  Widget detailRow(ReceiptItem item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(item.title, style: const TextStyle(fontSize: 16)),
            item.info != "" ? TextButton(
              child: const Icon( Icons.info_outline_rounded,color: Colors.black, size: 18,),
              onPressed: () => showInfo(item.info),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                minimumSize: const Size(0, 0),
              )
            ) : const SizedBox(),
          ],
        ),
        item.carbon == 0 ? const Text("N/A", style: const TextStyle(fontSize: 16)) : Text("${item.carbon.toStringAsFixed(1)}kg CO2", style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.receipt.title, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 2),
                Text(widget.receipt.formattedCreatedAt, style: const TextStyle(fontSize: 15, color: AppColor.grey)),
              ],
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete_forever_rounded),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: AppColor.cardGreen,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 42),
            CustomPieChart(data: dataMap()),
            const SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 14, right: 14, bottom: 24),
              child: CustomCard(
                title: "Receipt Details",
                subtitle: "Carbon details of the receipt items",
                color: AppColor.cardGreen,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Column(
                    children: [
                      ...widget.receipt.items.map((item) => Padding(padding: const  EdgeInsets.only(bottom: 7), child: detailRow(item))).toList(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 9),
                        decoration: const BoxDecoration(
                          color: Colors.black54
                        ),
                        height: 1,
                      ),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Sum", style: TextStyle(fontSize: 16)),
                          Text("${widget.receipt.totalCarbon.toStringAsFixed(1)}kg CO2", style: const TextStyle(fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                )
              ),
            ).animate()
            .slideY(duration: const Duration(milliseconds: 700), begin: 0.12, end: 0, curve: Curves.easeInOut)
            .fadeIn(duration: const Duration(milliseconds: 700), curve: Curves.easeInOut)
          ],
        ),
      )
    );
  }
}
