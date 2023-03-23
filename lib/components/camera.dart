import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key, required this.onReadyChange, required this.onPhotoTaken, required this.isLoading}) : super(key: key);

  final bool isLoading;
  final Function(bool) onReadyChange;
  final Function(File) onPhotoTaken;

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription>? _cameras;
  CameraController? controller;
  String? error;
  bool isTakingPicture = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await loadCameras();
    await openCamera();
    await Future.delayed(const Duration(milliseconds: 500));
    widget.onReadyChange(true);
    setState(() {});
  }

  Future<void> loadCameras() async {
    _cameras = await availableCameras();
  }

  Future<void> openCamera() async {
    List<CameraDescription>? cameras = _cameras;
    if (cameras == null || cameras.isEmpty) {
      return;
    }

    controller = CameraController(cameras[0], ResolutionPreset.max);
    try {
      await controller!.initialize();
      if (!mounted) {
        return;
      }
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            setState(() {
              error = 'The user did not grant access to the camera.';
            });
            break;
          default:
            setState(() {
              error = 'Unknown camera error: ${e.code}';
            });
            break;
        }
      }
    }
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  void takePicture() async {
    setState(() {
      isTakingPicture = true;
    });

    try {
     final file = await controller!.takePicture();
     widget.onPhotoTaken(File(file.path));
    } catch (e) {
      print(e);
    }

    setState(() {
      isTakingPicture = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.hourglass_empty_rounded, color: Colors.black38, size: 60),
          SizedBox(height: 12),
          SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white38,)),
        ],
      );
    }
    if (controller == null || !controller!.value.isInitialized) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.camera_rounded, color: Colors.black38, size: 60),
          SizedBox(height: 12),
          SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white38,)),
        ],
      );
    }
    if (error != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          Text(error!),
        ],
      );
    }
    return Stack(
      children: [
        CameraPreview(controller!),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.camera, color: isTakingPicture ? Colors.white30 : Colors.white),
                iconSize: 62,
                onPressed: isTakingPicture ? null : takePicture,
              ),
            ],
          )
        ),
      ],
    );
  }
}