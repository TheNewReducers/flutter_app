import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.image, required this.child, this.onTap, required this.color, required this.width});

  final ImageProvider image;
  final Color color;
  final Widget child;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    Widget content = Material(color: Colors.transparent, child: SingleChildScrollView(child: Column(
      children: [
        Image(image: image, width: width),
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))
          ),
          width: width,
          child: child,
        )
      ],
    )));

    if (onTap == null) {
      return content;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: content
      )
    );
  }
}