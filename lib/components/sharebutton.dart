import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatefulWidget {
  final GlobalKey widgetKey;

  const ShareButton({super.key, required this.widgetKey});

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          widget.widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        return;
      }
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final directory = (await getTemporaryDirectory()).path;
      File imgFile = File('$directory/screenshot.png');
      imgFile.writeAsBytesSync(pngBytes);

      await Share.shareFiles(['$directory/screenshot.png'],
          mimeTypes: ['image/png'], text: '🌍 I just discovered my carbon footprint with CarbonDiet! 🌱 Check it out and join me in making eco-friendly choices to fight climate change together. Every small step counts! 💚 #CarbonDiet #ClimateAction');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _captureAndSharePng,
      icon: const Icon(Icons.share_rounded),
    );
  }
}
