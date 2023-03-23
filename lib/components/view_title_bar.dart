import 'package:flutter/material.dart';

class ViewTitleBar extends StatelessWidget {
  const ViewTitleBar({super.key, required this.title, required this.xPadding});

  final String title;
  final double xPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 9),
      child: Row(
        children: [
          SizedBox(width: xPadding,),
          Text(title, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
        ]
      ),
    );
  }
}