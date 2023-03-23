import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class PhotoDialog extends StatelessWidget {

  const PhotoDialog({super.key});

  Future<String> _path() async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir =
        await Directory('${extDir.path}/test').create(recursive: true);
    return '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photo(pathBuilder: _path),
    );
  }
}
