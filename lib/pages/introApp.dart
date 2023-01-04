import 'dart:async';

import 'package:drivi/pages/chrome_safari_browser_example.screen.dart';
import 'package:flutter/material.dart';

class IntroApp extends StatefulWidget {
  IntroApp({Key? key}) : super(key: key);

  @override
  State<IntroApp> createState() => _IntroAppState();
}

class _IntroAppState extends State<IntroApp> {
  late Timer _timer;

  _IntroAppState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        MaterialPageRoute(
          builder: (context) => ChromeSafariBrowserExampleScreen(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/drivi.jpg"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
