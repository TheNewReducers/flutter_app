import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.image, required this.title, required this.color});

  final ImageProvider image;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: color,
      ),
      width: 280,
      height: 180,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 124,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 24, right: 24, bottom: 7),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, color: Colors.black87)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}