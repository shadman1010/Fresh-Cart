import 'package:flutter/material.dart';
import 'package:my_farm/screens/splash_screen.dart';
import 'package:my_farm/styles/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: themeData,
      home: const SplashScreen(),
    );
  }
}
