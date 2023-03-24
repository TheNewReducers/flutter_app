import 'package:flutter/material.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/services/navigation_service.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  void start() {
    AppState.setShowIntro(false);
    NavigationService.instance.pushNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/startimg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Why it matters", style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Text("Our food consumption accounts for one-third of global greenhouse gas emissions worldwide.", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 32),
                TextButton(
                  onPressed: start,
                  child: const Text("Start your Diet", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.transparent,
                    textStyle: const TextStyle(fontSize: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Colors.white, width: 1)
                    ),
                  ),
                )
              ],
            ), bottom: 60, left: 30, right: 30),
          ],
        )
      ),
    );
  }
}
