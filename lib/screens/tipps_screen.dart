import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/tipp_card.dart';
import 'package:flutter_app/constants/tipps.dart';

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
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...constantsTipps.map((e) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TippCard(
                tipp: e,
              )
            ],
          )),
        ],
      ))
    );
  }
}
