import 'package:app4/indetail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Events extends StatelessWidget {
 const Events ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(name: '',),
    );
  }
}

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key,required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{
  void _launchMaps() async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=Infosphere+E+AdityaCollege+Surampalem');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
  final List<String> allEvents = [
    'Hackathon',
    'AI Seminar',
    'Sports Meet',
    'Robo Fest',
    'Tech Talk',
  ];
  List<String> filteredEvents = [];
  String searchQuery = '';
  @override
  void initState(){
    super.initState();
    filteredEvents = allEvents;
  }
  void updateSearch(String value){
    setState((){
      searchQuery = value.toLowerCase();
      filteredEvents = allEvents.where((event) => event.toLowerCase().contains(searchQuery)).toList(); 
    });
  }
  @override
  Widget build(BuildContext context) {
    int page=0;
    return Scaffold(
       backgroundColor: Color(0xFFEFF4FB),
      //backgroundColor: Colors.lightBlue,
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
                  Text(widget.name, style: TextStyle(color: Colors.white)),
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
                            Text(widget.name,
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
              SizedBox(height: 20),
              if (searchQuery.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Search Results:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    ...filteredEvents.map((event) => Card(
                          child: ListTile(
                            title: Text(event),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      EventDetailPage(eventName: event),
                                ),
                              );
                            },
                          ),
                        )),
                  ],
                ),
              if (searchQuery.isEmpty) ...[
              SizedBox(height: 30),
              Align(alignment:Alignment.topLeft,child: Text("Live Updates",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
              SizedBox(
                child: AnimatedSection(
                  delay: 600,
                  child: CarouselSlider(
                     items : [
                      'https://www.rset.edu.in/gscc/wp-content/uploads/sites/8/2019/12/1507024386_3_n.jpg',
                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/coding-competition-design-template-87dba6fa6e8291b8fe5e29abc492288a_screen.jpg?ts=1676540509',
                      'https://tse4.mm.bing.net/th/id/OIP.82ySgi_em1NCTHkFmL4xdgHaEu?r=0&cb=thfvnext&rs=1&pid=ImgDetMain&o=7&rm=3',
  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
  'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
]
.map((url) {
                      return Material(
                        elevation: 5, // shadow effect
                        borderRadius: BorderRadius.circular(15),
                        clipBehavior: Clip.antiAlias, // ensures radius is applied to image
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 150.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.85,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      //autoPlay: true,
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
                ),
              ),
              SizedBox(height: 30), 
              SizedBox(
                // width: double.infinity,
                // height: 200,
                child: AnimatedSection(
                delay: 600,
                child: Column(
                  spacing: 7,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(alignment:Alignment.topLeft,child: Text("Highlights",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));

                        }, child: Text("See more",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                      ],
                    ),
                    CarouselSlider(
                      items: [
                        Image.network('https://tse4.mm.bing.net/th/id/OIP.DPhJ18GQ1aav1natxhIGUwHaEK?r=0&cb=thfvnext&rs=1&pid=ImgDetMain&o=7&rm=3', fit: BoxFit.cover),
                        Image.network('https://tse4.mm.bing.net/th/id/OIP.82ySgi_em1NCTHkFmL4xdgHaEu?r=0&cb=thfvnext&rs=1&pid=ImgDetMain&o=7&rm=3', fit: BoxFit.cover),
                        // Image.network('https://aditya.ac.in/aec/wp-content/uploads/2017/03/14139350731_d1603639b2.jpg ', fit: BoxFit.cover),
                        // Image.network('https://static.zollege.in/public/reviewPhotos/290701/1000059141.jpg', fit: BoxFit.cover),
                      ],
                      options: CarouselOptions(
                        height: 200.0,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        //autoPlay: true,
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
            ]
          
      ),
    )
      )
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