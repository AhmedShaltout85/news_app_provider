import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: isDarkMode
            ? Image.asset('assets/images/splash_screen_dark.png')
            : Image.asset('assets/images/splash_screen_light.png'),
      ),
    );
  }
}
