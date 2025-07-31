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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              //enlargeFactor: 0.5,
              autoPlay: true,
              height: double.infinity,
              viewportFraction: 1.0, 
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 1),
              autoPlayAnimationDuration: Duration(seconds: 1),
              onPageChanged: (index, reason) => setState(() {
                page = index;
              }),
            ),
            items: [
              buildSlide(
                "https://images.unsplash.com/photo-1557683316-973673baf926",
                "Know the live updates and events in Aditya.",
              ),
              buildSlide(
                "https://images.unsplash.com/photo-1533750349088-cd871a92f312",
                "Find the Paths",
              ),
              buildSlide(
                "https://images.unsplash.com/photo-1547036967-23d11aacaee0",
                "Get Involved. Explore. Grow.",
              ),
            ],
          ),
          Positioned( 
            bottom: 30,
            left: 0,
            right: 0,
            child: buildDots(page),
          ),
        ],
      ),
    );
  }

  Widget buildSlide(String imageUrl, String text) {
    return Stack(
      children: [
        Container(
          width: double.infinity, 
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42, 
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
              softWrap: true,
              maxLines: 6,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child:ElevatedButton(onPressed: (){
            Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => Mylog()),
                           );
          },
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 300),
          disabledBackgroundColor: Colors.grey,
        ), child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("NEXT",style:TextStyle(fontSize: 20,color: Colors.white),),
        ),
        ) 
        )
      ],
    );
  }

  Widget buildDots(int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == page ? Colors.blue : Colors.grey[400],
          ),
        );
      }),
    );
  }
}
