import 'package:flutter/material.dart';

void main() => runApp(const ResponsiveApp());

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exercício 2 - Responsividade')),
        body: LayoutBuilder(
          builder: (context, sizes) {
            // Se a largura for menor que 500px, renderiza lista
            if (sizes.maxWidth < 500) {
              return ListView(children: _getCards());
            } 
            // Caso contrário, renderiza grade (grid)
            return GridView.count(crossAxisCount: 3, children: _getCards());
          },
        ),
      ),
    );
  }

  List<Widget> _getCards() => List.generate(9, (i) => Card(
    color: Colors.blue[100 * (i % 9)],
    child: Center(child: Text('Item $i')),
  ));
}