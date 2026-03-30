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
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
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
            Center(
              child: Theme(
                data: ThemeData(
                  scaffoldBackgroundColor: Colors.grey[400],
                ),
                child: Builder(
                  builder: (context) {
                    return Container(
                      width: 400,
                      height: 350,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            primaryColor: Colors.yellow,
                          ),
                          child: Builder(
                            builder: (context) {
                              return Container(
                                width: 250,
                                height: 200,
                                color: Theme.of(context).primaryColor,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}