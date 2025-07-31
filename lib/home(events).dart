
//import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Events extends StatelessWidget {
  const Events ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _launchMaps() async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=Infosphere+E+AdityaCollege+Surampalem');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    int page=0;
    return Scaffold(
      backgroundColor: Color(0xFFEFF4FB),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/women/68.jpg'),
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text('Ushodaya', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text('Remainders'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Get Directions'),
              onTap: _launchMaps,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Builder(
                builder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(
                              'https://randomuser.me/api/portraits/women/68.jpg'),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hi Ushodaya',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54)),
                            Text('Good Morning',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Scaffold.of(context).openEndDrawer(),
                      child: Icon(Icons.menu, size: 30, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              AnimatedSection
              (
                delay: 600,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search events...',
                                    border: InputBorder.none),
                                onSubmitted: (query) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SearchResultPage(query),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Color(0xFF4F46E5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.tune, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              AnimatedSection(
                delay: 600,
                child: SectionWidget(
                  title: 'Places',
                  onTapShowAll: () {},
                  itemList: [
                    'Library',
                    'Auditorium',
                    'Playground',
                    'Canteen',
                    'Campus',
                    'Lab',
                    'Classroom',
                  ],
                  imageKeyword: 'college',
                  isPlace: true,
                ),
              ),
              SizedBox(height: 30),
              // AnimatedSection(delay: 600,child: AnimatedContainer(duration: Duration(seconds: 3),child: Text("Highlight",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold)))),
              Container(
                child: AnimatedSection(
                delay: 600,
                child: Column(
                  spacing: 7,
                  children: [
                    Align(alignment:Alignment.topLeft,child: Text("Highlights",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                    CarouselSlider(
                      items: [
                        Image.network('https://images.unsplash.com/photo-1557683316-973673baf926', fit: BoxFit.cover),
                        Image.network('https://images.unsplash.com/photo-1557683316-973673baf926', fit: BoxFit.cover),
                        Image.network('https://images.unsplash.com/photo-1557683316-973673baf926', fit: BoxFit.cover),
                        Image.network('https://images.unsplash.com/photo-1557683316-973673baf926', fit: BoxFit.cover),
                      ],
                      options: CarouselOptions(
                        height: 200.0,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            page = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                            ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
class SectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTapShowAll;
  final List<String> itemList;
  final String imageKeyword;
  final bool isPlace;

  const SectionWidget({
    super.key,
    required this.title,
    required this.onTapShowAll,
    required this.itemList,
    required this.imageKeyword,
    required this.isPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: onTapShowAll,
                child: Text('Show all',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: isPlace ? 100 : 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final title = itemList[index];
                final image = 'https://source.unsplash.com/200x140/?$imageKeyword,$title';
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => isPlace
                          ? PlaceDetailPage(placeName: title)
                          : EventDetailPage(eventName: title),
                    ),
                  ),
                  child: isPlace
                      ? CityCard(cityName: title, imagePath: image)
                      : RecommendedCard(title: title, imagePath: image),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String imagePath;
  final String cityName;

  const CityCard({super.key, required this.imagePath, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(imagePath,
                width: 60, height: 60, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(cityName,
              style: TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const RecommendedCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imagePath,
              height: 140,
              width: 220,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class EventDetailPage extends StatelessWidget {
  final String eventName;
  const EventDetailPage({super.key, required this.eventName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(eventName)),
      body: Center(child: Text("Details about $eventName")),
    );
  }
}

class PlaceDetailPage extends StatelessWidget {
  final String placeName;
  const PlaceDetailPage({super.key, required this.placeName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(placeName)),
      body: Center(child: Text("Details about $placeName")),
    );
  }
}

class SearchResultPage extends StatelessWidget {
  final String query;
  const SearchResultPage(this.query, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: Center(child: Text("Results for '$query'")),
    );
  }
}
class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  final Map<String, String> faq = {
  'library timings': 'The library is open from 8:00 AM to 6:00 PM on weekdays.',
  'hod name': 'The HOD of Computer Science is Dr. K. Suresh Kumar.',
  'placement officer': 'Our Placement Officer is Mr. Ramesh Babu, Room No. 102.',
  'canteen menu': 'The canteen offers South Indian, North Indian meals, snacks, and beverages.',
  'sports coordinator': 'The Sports Coordinator is Ms. Anjali, available in the sports block.',
  'fee deadline': 'The last date to pay semester fees is 10th August.',
  'exam schedule': 'Mid-semester exams start from 25th September.',
  'event date': 'The Tech Fest is scheduled for 15th October.',
  'wifi password': 'Please contact the IT department in Block C for WiFi credentials.',
  'bus timings': 'College buses leave campus at 4:30 PM every day.',
  'lab availability': 'Labs are open from 9:30 AM to 5:00 PM, except Sundays.',
  'faculty advisor': 'You can find your Faculty Advisor in your department notice board list.',
  'student login issues': 'For login problems, contact the IT Help Desk on the ground floor.',
  'revaluation process': 'Revaluation forms are available online. Last date to apply: 20th August.',
  'hostel rules': 'Hostel gates close by 9:00 PM. Visitors allowed between 5 PM and 7 PM.',
  'anti ragging cell': 'For ragging complaints, contact Prof. Ravi (ext. 204).',
  'exam results': 'Results are published on the official portal under "Examinations" tab.',
  'college fest': 'Cultural Fest "Sparsh" will be held in December, dates to be announced.',
  'internship portal': 'Internship opportunities are updated on the Training & Placement cell website.',
  'dress code': 'Students must wear ID cards. Lab coats are mandatory for lab sessions.',
};


  void sendMessage(String message) {
    setState(() {
      messages.add({'user': message});
      String lower = message.toLowerCase();
      String? reply;
      faq.forEach((key, value) {
        if (lower.contains(key)) reply = value;
      });
      messages.add({
        'bot': reply ?? 'Sorry, I can answer only college-related queries.'
      });
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('College Chatbot',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.indigo),)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message.containsKey('user');
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isUser ? message['user']! : message['bot']!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child:
                  AnimatedContainer(
                    duration: Duration(seconds: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 3,color: Colors.indigo)),
                    padding: EdgeInsets.all(16),
                  child:
                  TextField(
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    controller: controller,
                    
                    decoration: InputDecoration(hintText:'Clarify your queries...',border:InputBorder.none),
                  )
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      sendMessage(controller.text.trim());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class AnimatedSection extends StatefulWidget {
  final Widget child;
  final int delay;

  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = 0,
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeInOutBack),
    ));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
