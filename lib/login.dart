
import 'package:app4/Home1.dart';
import 'package:app4/signup.dart';
import 'package:flutter/material.dart';

class Mylog extends StatefulWidget {
  const Mylog({super.key});

  @override
  State<Mylog> createState() => _MynewState();
}

class _MynewState extends State<Mylog> {
  final _key = GlobalKey<FormState>();
  bool isVisible = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username cannot be empty';
    } else if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must include at least one number';
    }
    return null;
  }
  final List<Map<String, String>> validUsers = [
    {'username': 'ramya', 'password': '123345'},
    {'username': 'ushodaya', 'password': '345678'},
    {'username': 'satya', 'password': '111111'},
    {'username': 'harshi', 'password': '111222'},
    {'username': 'kavya', 'password': '888999'},
  ];
  void checkLogin() {
  final enteredUsername = _usernameController.text.trim();
  final enteredPassword = _passwordController.text;

  final user = validUsers.firstWhere(
    (user) => user['username'] == enteredUsername,
    orElse: () => {},
  );

  if (user.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User not registered")),
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Mynew()));
    });
  } else if (user['password'] != enteredPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Incorrect password")),
    );
  } else {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text("Login successful")),
       Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1675603849760-fce371511327?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXBwJTIwYmFja2dyb3VuZCUyMHdpdGglMjBibGFjayUyMGJhY2tncm91bmR8ZW58MHx8MHx8fDA%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              height: 470,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Form(
                key: _key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        "Finally your journey is here",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _usernameController,
                      validator: validateUsername,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your name',
                        prefixIcon: const Icon(Icons.person),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.teal, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      validator: validatePassword,
                      obscureText: !isVisible,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.key_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.teal, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            checkLogin();
                            
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Mynew()));
                            },
                            child: const Text(
                              "Create one",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
