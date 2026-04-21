import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final List<bool> _tarefasConcluidas = List.generate(5, (index) => false);

  void _exibirAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: const Text('Você está no App de Notas de Tarefas'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('View Completed Tasks'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'You have 5 uncompleted tasks',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.amber[200],
                  child: ListTile(
                    title: Text('Task 2022-07-09\n18:08:3${index}.734244'),
                    trailing: Checkbox(
                      value: _tarefasConcluidas[index],
                      onChanged: (bool? valor) {
                        setState(() {
                          _tarefasConcluidas[index] = valor ?? false;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _exibirAlerta(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}