import 'dart:io';

import 'package:flutter_app/components/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class PhotoDialog extends StatelessWidget {

  const PhotoDialog({super.key});

  // Future<String> _path() async {
  //   final Directory extDir = await getTemporaryDirectory();
  //   final testDir =
  //       await Directory('${extDir.path}/test').create(recursive: true);
  //   return '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  // }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: const Camera()
      ),
    );
  }
}
