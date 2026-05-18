import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settingsBox');
  runApp(const MyApp());
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Box _myBox = Hive.box('settingsBox');
  late bool _isRelaxMode;

  @override
  void initState() {
    super.initState();
    _isRelaxMode = _myBox.get('isRelaxMode', defaultValue: true);
  }

  void _toggleMode() {
    setState(() {
      _isRelaxMode = !_isRelaxMode;
      _myBox.put('isRelaxMode', _isRelaxMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _isRelaxMode ? Colors.blue.shade700 : Colors.green.shade700;
    final String textDisplay = _isRelaxMode ? "Modo Relax" : "Modo Focado";

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _toggleMode,
          child: Text(
            textDisplay,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}