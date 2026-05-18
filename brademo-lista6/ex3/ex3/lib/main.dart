import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('bancoTarefas');

  runApp(
    ChangeNotifierProvider(
      create: (context) => TarefaProvider(),
      child: const MyApp(),
    ),
  );
}

class TarefaProvider extends ChangeNotifier {
  final Box _box = Hive.box('bancoTarefas');
  List<String> _tarefas = [];

  TarefaProvider() {
    _carregarTarefas();
  }

  List<String> get tarefas => _tarefas;

  void _carregarTarefas() {
    final dadosSalvos = _box.get('lista', defaultValue: []);
    _tarefas = List<String>.from(dadosSalvos);
    notifyListeners();
  }

  void adicionarTarefa(String novaTarefa) {
    if (novaTarefa.trim().isEmpty) return;
    _tarefas.add(novaTarefa);
    _sincronizarHive();
  }

  void removerTarefa(int index) {
    _tarefas.removeAt(index);
    _sincronizarHive();
  }

  void _sincronizarHive() {
    _box.put('lista', _tarefas);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Consumer<TarefaProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Nova tarefa',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) {
                          provider.adicionarTarefa(value);
                          controller.clear();
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        provider.adicionarTarefa(controller.text);
                        controller.clear();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = provider.tarefas[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        title: Text(tarefa),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => provider.removerTarefa(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}