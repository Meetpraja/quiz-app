import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/views/quiz_home.dart';
import 'package:quiz_app/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz app',
      home: SplashScreen(),
    );
  }
}
