import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.image, required this.child, this.onTap, required this.color});

  final ImageProvider image;
  final Color color;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const imageHeight = 180.0;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 240,
        height: 320,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: imageHeight - 46),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 46),
                      child
                    ],
                  )
                ),
              ],
            ),
            Positioned(child: Image(image: image), top: 0, left: 0, right: 0,)
          ],
        ),
      )
    );
  }
}