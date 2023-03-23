import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';

class TippsScreen extends StatefulWidget {
  const TippsScreen({super.key});

  @override
  State<TippsScreen> createState() => _TippsScreenState();
}

class _TippsScreenState extends State<TippsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text("All Tipps"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const Card(
          child: ListTile(
            title: Text("Test"),
            subtitle: Text("Test"),
          ),
        ),
      )
    );
  }
}
