import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/custom_image_card.dart';
import 'package:flutter_app/models/reduce_carbon_tipp.dart';

class TippDialog extends StatefulWidget {

  const TippDialog({super.key, required this.tipp});

  final ReduceCarbonTipp tipp;

  @override
  State<TippDialog> createState() => _TippDialogState();
}

class _TippDialogState extends State<TippDialog> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      insetPadding: const EdgeInsets.only(top: 7, left: 7, right: 7, bottom: 120),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: Key("tipp:${widget.tipp.imagePath}"), child: CustomImageCard(
            image: AssetImage(widget.tipp.imagePath),
            color:AppColor.cardGreen,
            child: AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: isExpanded ? 300 : 90,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: Text(widget.tipp.title, style: const TextStyle(fontSize: 18)))
                    ],
                  ),
                )
              ),
            )
          )
        ],
      )
    );
  }
}
