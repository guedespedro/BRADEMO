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
          title: const Text('Flutter is Fun!'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.deepOrange,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Hi Mom',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 4),
                Icon(Icons.back_hand, color: Colors.yellow, size: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'CALL',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.near_me),
              label: 'ROUTE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: 'SHARE',
            ),
          ],
        ),
      ),
    );
  }
}