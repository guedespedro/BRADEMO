import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exercício 3')),
        body: Container(
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: const WidgetTeste(),
        ),
      ),
    );
  }
}

class WidgetTeste extends StatelessWidget {
  const WidgetTeste({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      color: Colors.white,
      child: const Center(
        child: Text(
          'Constraints go down. Sizes go up. Parent sets position.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}