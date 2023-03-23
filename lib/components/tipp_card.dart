import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/components/custom_image_card.dart';
import 'package:flutter_app/dialog/tipp_dialog.dart';
import 'package:flutter_app/models/reduce_carbon_tipp.dart';

class TippCard extends StatelessWidget {
  const TippCard({super.key, required this.tipp});

  final ReduceCarbonTipp tipp;

  void openOverlay(BuildContext context) {
    // showDialog(context: context, builder: (context) => TippDialog(tipp: tipp));
    Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            barrierDismissible: true,
            barrierColor: Colors.black54,
            pageBuilder: (BuildContext context, _, __) {
                return TippDialog(tipp: tipp);
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(tag: Key("tipp:${tipp.imagePath}"), child: CustomImageCard(
      width: 240,
      image: AssetImage(tipp.imagePath),
      onTap: () => openOverlay(context),
      color: AppColor.cardGreen,
      child: Container(
        width: 240,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Text(tipp.title, style: const TextStyle(fontSize: 18)))
          ],
        ),
      )
    ));
  }
}