import 'package:flutter/material.dart';

void main() {
  runApp(
      SplashScreenApp()
  );
}

class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color(0xFFF99231),
        backgroundColor: Color(0xFF000000),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/img/logo.png',
                  width: 200,
                ),
                CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}