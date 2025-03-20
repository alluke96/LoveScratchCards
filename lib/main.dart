import 'package:flutter/material.dart';
import 'package:love_scratch_cards/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Outfit',
        primaryColor: Colors.green,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
