import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  /// Default Constructor
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription>? _cameras;
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    
  }

  void init() async {
    await loadCameras();
    openCamera();
  }

  Future<void> loadCameras() async {
    _cameras = await availableCameras();
    openCamera();
  }

  void openCamera() {
    List<CameraDescription>? cameras = _cameras;
    if (cameras == null || cameras.isEmpty) {
      return;
    }

    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return CameraPreview(controller!);
  }
}