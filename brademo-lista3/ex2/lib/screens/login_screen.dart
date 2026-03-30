import 'package:flutter/material.dart';
import '../models/login.dart';
import '../widgets/login_form.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _handleLogin(BuildContext context, Login credentials) {
    if (credentials.username == 'admin' && credentials.password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falha no login')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const FlutterLogo(size: 100),
            const Text('Flutter', style: TextStyle(fontSize: 30, color: Colors.grey)),
            LoginForm(onLogin: (cred) => _handleLogin(context, cred)),
            const Text('New User? Create Account'),
          ],
        ),
      ),
    );
  }
}