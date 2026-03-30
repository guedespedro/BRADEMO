import 'package:flutter/material.dart';
import '../models/login.dart';

class LoginForm extends StatefulWidget {
  final Function(Login) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _userController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          TextButton(onPressed: () {}, child: const Text('Forgot Password')),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onLogin(Login(
                  username: _userController.text,
                  password: _passController.text,
                ));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}