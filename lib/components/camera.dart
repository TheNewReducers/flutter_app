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
  String? error;

  @override
  void initState() {
    super.initState();
    init();
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
    print(cameras);
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
    return CameraPreview(controller!);
  }
}