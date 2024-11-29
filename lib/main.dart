import 'package:flutter/material.dart';

import 'package:instagram_ui_one/screens/splash_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Color(0xffF35383),
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
