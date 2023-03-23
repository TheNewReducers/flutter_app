import 'package:flutter/material.dart';
import 'package:flutter_app/dialog/photo_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _showPhotoDialog() {
    showDialog(context: context, builder: (context) => const PhotoDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          switch (value) {
            case 0:
              break;
            case 1:
              _showPhotoDialog();
              break;
            case 2:
              break;
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.add_a_photo),
            label: 'Take Photo',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: 'Historie',
          ),
        ],
      ),
    );
  }
}
