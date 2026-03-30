import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE0E0E0),
      ),
      home: const Scaffold(
        body: Center(
          child: SizedBox(
            width: 250,
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}