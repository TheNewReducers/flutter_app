import 'package:flutter/material.dart';
import 'package:flutter_app/components/sharebutton.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.color, required this.child, required this.title, required this.subtitle, this.shareable = false});

  final Color color;
  final Widget child;
  final String title;
  final String subtitle;
  final bool shareable;

  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(
          key: widgetKey,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: color,
            ),
            padding: const EdgeInsets.all(7),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 7),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(title, style: const TextStyle(
                            fontSize: 18, 
                            color: Colors.black87,
                            fontWeight: FontWeight.bold
                            )),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                ),
                child
              ],
            ),
          )
        ),
        shareable ? Positioned(
          top: 7,
          right: 7,
          child: ShareButton(
            widgetKey: widgetKey,
          ),
        ) : const SizedBox(),
      ],
    );
  }
}