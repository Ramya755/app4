import 'package:flutter/material.dart';
import 'package:app4/Home1.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;

  final List<Map<String, String>> studentAccounts = [];

  void checkStudentLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    final user = studentAccounts.firstWhere(
      (u) => u['username'] == username && u['password'] == password,
      orElse: () => {},
    );

    if (user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Student not found or wrong password")),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(name: username),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Student Login", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter username' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter password' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkStudentLogin();
                  }
                },
                child: const Text("Login as Student"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
