import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/tidal-tall-white-rgb.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
