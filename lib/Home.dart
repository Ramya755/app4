
import 'package:app4/admin.dart';
import 'package:app4/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;

  final List<List<Color>> bgColors = [
    [const Color.fromARGB(255, 138, 158, 186), const Color.fromARGB(255, 162, 197, 226)],
    [const Color.fromARGB(255, 138, 163, 201), const Color.fromARGB(255, 132, 155, 174)],
    [const Color.fromARGB(255, 180, 186, 196), const Color.fromARGB(255, 188, 205, 219)],
    
  ];

  final List<String> texts = [
    "Smart Updates. Smarter Campus.",
    "Find Places. Join Events Easily.",
    "Connect,participate,and Explore.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: texts.length,
            itemBuilder: (context, index, realIndex) {
              return AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: bgColors[index],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      texts[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 2),
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) => setState(() {
                page = index;
              }),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Mylog()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  "NEXT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: buildDots(page),
          ),
        ],
      ),
    );
  }

  Widget buildDots(int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(texts.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == page ? Colors.white : Colors.white54,
          ),
        );
      }),
    );
  }
}
