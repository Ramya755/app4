import 'package:app4/chatbot.dart';
import 'package:app4/home(events).dart';
import 'package:app4/mynotes.dart';
import 'package:app4/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';


class MainScreen extends StatefulWidget {
  final String name;
  const MainScreen ({super.key,required this.name});

  @override
  State<MainScreen> createState() => _MyAppState();
}

class _MyAppState extends State<MainScreen> {
  
  int _controller = 0;
  @override
  Widget build(BuildContext context) {
    final List screen = [HomePage(name: widget.name,), ChatbotPage(), NotesApp(),MyProfile(name: widget.name,)];
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: screen[_controller],
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (val) {
            setState(() {
              _controller = val;
            });
          },
          items: [
            Icon(Icons.home),
            Icon(Icons.chat),
            Icon(Icons.note),
            Icon(Icons.person)
          ]
        ),
      ),
    );
  }
}
