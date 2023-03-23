import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/components/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/receipt.dart';
import 'package:flutter_app/services/api.dart';

class PhotoDialog extends StatefulWidget {

  const PhotoDialog({super.key});

  @override
  State<PhotoDialog> createState() => _PhotoDialogState();
}

class _PhotoDialogState extends State<PhotoDialog> {
  bool isReady = false;
  bool isProcessing = false;
  
  // Future<String> _path() async {
  //   final Directory extDir = await getTemporaryDirectory();
  //   final testDir =
  //       await Directory('${extDir.path}/test').create(recursive: true);
  //   return '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  // }

  void onPhotoTaken(File file) async {
    setState(() {
      isProcessing = true;
    });

    //await Future.delayed(const Duration(seconds: 2));
    // String result = await Api.uploadImage(file);
    String result = await Api.uploadImageDummy(file);
    Receipt receipt = Receipt.fromJson(jsonDecode(result));

    AppState.addReceipt(receipt);

    setState(() {
      isProcessing = false;
    });
  }

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
          child: SizedBox(height: !isReady || isProcessing ? 300 : MediaQuery.of(context).size.height - 200, child: Camera(onReadyChange: onReadyChange, onPhotoTaken: onPhotoTaken, isLoading: isProcessing,)),
        ),
      ),
    );
  }
}
