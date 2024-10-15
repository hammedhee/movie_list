import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:move_list/homepage.dart';
//import 'package:move_list/login_page.dart';
import 'package:move_list/movie_list_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _hideSystemUI();
    _navigateToNextScreen();
  }

  // Hide system UI to provide an immersive experience
  void _hideSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  // Navigate to DemoPage after a delay of 6 seconds
  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2),   () {
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const DemoPage()));
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("asset/img3.webp"),
              ),
            ),
          ),
          // Text and icon with gradient overlay
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100), // Add spacing between top and icon
                // Icon with gradient
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.purple, Colors.blue, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                ),
                const SizedBox(
                    height: 10), // Additional space between the icon and text
                // Text with gradient
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.pink, Colors.orange, Colors.yellow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "MOVIES!",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .white, // The color becomes the base for the gradient
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}