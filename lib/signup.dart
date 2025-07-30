import 'package:app4/Home1.dart';

import 'package:flutter/material.dart';

class Mynew extends StatefulWidget {
  const Mynew({super.key});

  @override
  State<Mynew> createState() => _MynewState();
}

class _MynewState extends State<Mynew> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Create a new account",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Create your account now to start your journey",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 40),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your name";
                            } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                              return "Name must contain only letters";
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            label: Text(
                              'Full name',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            hintText: 'Enter your name',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            } else if (!value.endsWith('@gmail.com')) {
                              return "Email must end with @gmail.com";
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            label: Text(
                              'Email',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            hintText: 'Enter your email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _pass,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the password";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            } else if (!RegExp(r'[A-Z]').hasMatch(value) ||
                                !RegExp(r'[a-z]').hasMatch(value) ||
                                !RegExp(r'[0-9]').hasMatch(value)) {
                              return "Password must include upper, lower, and number";
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20),
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            label: Text(
                              'Password',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            hintText: 'Enter your password',
                            prefixIcon: Icon(Icons.key_outlined),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: isVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.teal,
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
