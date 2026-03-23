import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack & Positioned Widget'),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.green[400],
                padding: const EdgeInsets.all(8),
                child: const Text('Green', style: TextStyle(color: Colors.white)),
              ),
            ),
            Positioned(
              top: 80,
              left: 80,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.red[400],
                padding: const EdgeInsets.all(8),
                child: const Text('Red', style: TextStyle(color: Colors.white)),
              ),
            ),
            Positioned(
              top: 110,
              left: 110,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.purple[300],
                padding: const EdgeInsets.all(8),
                child: const Text('Purple', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}