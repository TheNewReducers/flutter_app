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

  bool visible = false;

  @override
  void initState() {
    super.initState();

  }

  void showContent() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double bottom = (MediaQuery.of(context).size.height - 742.0) / 2.0;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      insetPadding: EdgeInsets.only(top: 24, left: 14, right: 14, bottom: bottom),
      clipBehavior: Clip.antiAlias,
      child: Hero(
        tag: Key("tipp:${widget.tipp.imagePath}"),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: CustomImageCard(
            image: AssetImage(widget.tipp.imagePath),
            color:AppColor.cardGreen,
            width: MediaQuery.of(context).size.width - 14,
            child: Container(
              height: 420,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Flexible(child: Text(widget.tipp.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),)
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Flexible(child: Text(widget.tipp.description, style: const TextStyle(fontSize: 18, height: 1.3)),)
                    ],
                  ),
                ],
              )
            )
          )
        )
      )
    );
  }
}
