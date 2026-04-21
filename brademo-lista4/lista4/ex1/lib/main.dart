import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // Lista atualizada com Schubert e links específicos
  final List<Map<String, String>> bustos = [
    {
      "url": "https://m.media-amazon.com/images/I/61YiGoUBuML.jpg",
      "legenda": "busto de chopin"
    },
    {
      "url": "https://m.media-amazon.com/images/I/51b4LnD2YwL.jpg",
      "legenda": "busto de beethoven"
    },
    {
      "url": "https://m.media-amazon.com/images/I/71Jvp9JmAfL._AC_UF894,1000_QL80_.jpg",
      "legenda": "busto de bach"
    },
    {
      "url": "https://m.media-amazon.com/images/I/61gVAVa2ATL._AC_UF894,1000_QL80_.jpg",
      "legenda": "busto de tchaikovsky"
    },
    {
  "url": "https://http2.mlstatic.com/D_NQ_NP_956457-MLB89444857705_082025-O.webp",
  "legenda": "busto de schubert"
},
    {
      "url": "https://cdn.pixabay.com/photo/2017/10/09/11/24/franz-liszt-2833136_1280.jpg",
      "legenda": "busto de liszt"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercício 1 - Galeria de Bustos'),
          backgroundColor: Colors.blueGrey,
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 200,
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: _buildGridImages(),
        ),
      ),
    );
  }

  List<Widget> _buildGridImages() {
    return bustos.map((item) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white, // Fundo branco para imagens com BoxFit.contain
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Padding para a imagem não tocar na borda
                child: Image.network(
                  item["url"]!,
                  // BoxFit.contain: a imagem será redimensionada para caber 
                  // inteira dentro do quadrado, sem cortes.
                  fit: BoxFit.contain, 
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.black.withOpacity(0.05),
              child: Text(
                item["legenda"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}