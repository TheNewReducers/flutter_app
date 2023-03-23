import 'dart:io';

import 'package:flutter_app/components/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class PhotoDialog extends StatefulWidget {

  const PhotoDialog({super.key});

  @override
  State<PhotoDialog> createState() => _PhotoDialogState();
}

class _PhotoDialogState extends State<PhotoDialog> {
  bool isReady = false;
  
  // Future<String> _path() async {
  //   final Directory extDir = await getTemporaryDirectory();
  //   final testDir =
  //       await Directory('${extDir.path}/test').create(recursive: true);
  //   return '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  // }

  void onReadyChange(bool ready) {
    setState(() {
      isReady = ready;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.only(top: 7, left: 7, right: 7, bottom: 120),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: SizedBox(height: isReady ? MediaQuery.of(context).size.height - 200 : 300, child: Camera(onReadyChange: onReadyChange)),
        ),
      ),
    );
  }
}
