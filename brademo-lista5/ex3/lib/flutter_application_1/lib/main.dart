import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post.dart';

void main() => runApp(MaterialApp(home: MyHomePage(), debugShowCheckedModeBanner: false));

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String urlBase = 'https://jsonplaceholder.typicode.com/posts';
  List<Post> posts = [];
  bool carregando = false;
  Post? postSendoEditado;

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _corpoController = TextEditingController();

  Future<void> buscarPosts() async {
    setState(() => carregando = true);
    try {
      final response = await http.get(Uri.parse(urlBase));
      if (response.statusCode == 200) {
        List<dynamic> dados = jsonDecode(response.body);
        setState(() {
          posts = dados.map((m) => Post.fromMap(m)).take(5).toList();
        });
      }
    } finally {
      setState(() => carregando = false);
    }
  }

  Future<void> criarPost() async {
    if (_tituloController.text.isEmpty) return;
    setState(() => carregando = true);
    try {
      final response = await http.post(
        Uri.parse(urlBase),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'title': _tituloController.text,
          'body': _corpoController.text,
          'userId': 1
        }),
      );

      if (response.statusCode == 201) {
        setState(() => posts.insert(0, Post.fromMap(jsonDecode(response.body))));
        _limparCampos();
      }
    } finally {
      setState(() => carregando = false);
    }
  }

  Future<void> editarPost() async {
    if (postSendoEditado == null || _tituloController.text.isEmpty) return;
    setState(() => carregando = true);
    try {
      final response = await http.put(
        Uri.parse('$urlBase/${postSendoEditado!.id}'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'id': postSendoEditado!.id,
          'title': _tituloController.text,
          'body': _corpoController.text,
          'userId': postSendoEditado!.userId,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          int index = posts.indexWhere((p) => p.id == postSendoEditado!.id);
          if (index != -1) {
            posts[index] = Post.fromMap(jsonDecode(response.body));
          }
          postSendoEditado = null;
        });
        _limparCampos();
      }
    } finally {
      setState(() => carregando = false);
    }
  }

  Future<void> deletarPost(int id) async {
    setState(() => carregando = true);
    try {
      final response = await http.delete(Uri.parse('$urlBase/$id'));
      if (response.statusCode == 200) {
        setState(() {
          posts.removeWhere((p) => p.id == id);
          if (postSendoEditado?.id == id) {
            postSendoEditado = null;
            _limparCampos();
          }
        });
      }
    } finally {
      setState(() => carregando = false);
    }
  }

  void _limparCampos() {
    _tituloController.clear();
    _corpoController.clear();
    setState(() => postSendoEditado = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD Dinâmico')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(controller: _tituloController, decoration: InputDecoration(labelText: 'Título')),
                    TextField(controller: _corpoController, decoration: InputDecoration(labelText: 'Conteúdo')),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: postSendoEditado == null ? criarPost : editarPost,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: postSendoEditado == null ? Colors.blue : Colors.orange,
                          ),
                          child: Text(postSendoEditado == null ? 'Criar Novo Post' : 'Salvar Alterações'),
                        ),
                        if (postSendoEditado != null)
                          TextButton(onPressed: _limparCampos, child: Text('Cancelar')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: buscarPosts, child: Text('Carregar da API')),
          if (carregando) const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          setState(() {
                            postSendoEditado = post;
                            _tituloController.text = post.title;
                            _corpoController.text = post.body;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deletarPost(post.id),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}