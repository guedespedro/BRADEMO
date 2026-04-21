import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

const Color red = Colors.red;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlutterLayoutArticle([
      Example3(),
    ]);
  }
}

abstract class Example extends StatelessWidget {
  const Example({super.key});
  String get code;
  String get explanation;
}

class FlutterLayoutArticle extends StatefulWidget {
  const FlutterLayoutArticle(this.examples, {super.key});
  final List<Example> examples;

  @override
  State<FlutterLayoutArticle> createState() => _FlutterLayoutArticleState();
}

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  late int count;

  @override
  void initState() {
    count = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFCCCCCC),
          body: Column(
            children: [
              Expanded(
                child: widget.examples[count - 1],
              ),
              Container(
                height: 50,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.examples.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: count == i + 1 ? Colors.grey : Colors.grey[800],
                          ),
                          onPressed: () => setState(() => count = i + 1),
                          child: Text((i + 1).toString()),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Example3 extends Example {
  const Example3({super.key});

  @override
  final code = '';
  @override
  final explanation = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: red,
        child: const Center(
          child: Text(
            'Exercício 3',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}