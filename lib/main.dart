import 'package:flutter/material.dart';
import 'package:qr_code_pro/presentation/ui/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Qr Code Pro",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen()));
}
