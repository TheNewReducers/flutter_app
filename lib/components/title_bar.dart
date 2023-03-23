import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title, required this.onMorePressed, required this.xPadding});

  final String title;
  final VoidCallback onMorePressed;
  final double xPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: xPadding,),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const Expanded(child: SizedBox()),
        TextButton(onPressed: onMorePressed, child: Row(
          children: [
            const Text("SEE ALL"),
            Icon(Icons.chevron_right)
          ],
        ))
      ]
    );
  }
}