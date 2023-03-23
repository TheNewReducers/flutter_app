import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({super.key, required this.children, required this.initialPadding});

  final List<Widget> children;
  final double initialPadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          SizedBox(width: initialPadding),
          ...children.map((c) {
            Widget padded = Padding(
              padding: const EdgeInsets.only(right: 14),
              child: c,
            );
            return padded;
          }).toList(),
        ]
      )
    );
  }
}