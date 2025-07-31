import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
class Details extends StatelessWidget {
  const Details({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> events = [
  {
    'name': 'Sports',
    'image':
        'https://tse1.mm.bing.net/th/id/OIP.mkOJu6Ts27hheE-OQJW1vAHaER?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [
      {
        'name': 'Kho-Kho',
        'description': 'Kho-Kho is a traditional Indian tag sport played by teams of 12. '
            'It emphasizes speed, agility, and teamwork. '
            'The game is played in a rectangular court where chasers try to tag defenders.',
        'image': 'https://tse2.mm.bing.net/th/id/OIP.4hYVWx_YIFzRTus8k9NPVwHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Kabaddi',
        'description': 'Kabaddi is a contact team sport where players raid the opposing team’s half. '
            'The objective is to tag players and return to their half without getting caught. '
            'It tests strength, strategy, and breath control.',
        'image': 'https://tse3.mm.bing.net/th/id/OIP.fj3_bXZtX1Rm-5H_qGStqwHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Long jump',
        'description': 'Long jump is a field event in athletics where athletes jump for distance. '
            'The jump is measured from the take-off line to the nearest mark in the landing area. '
            'It requires speed, strength, and precise timing.',
        'image': 'https://tse2.mm.bing.net/th/id/OIP.cCX-dHffZFqovjjjp9v07QHaFb?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
    ],
  },
  {
    'name': 'NCC',
    'image':
        'https://tse4.mm.bing.net/th/id/OIP.bGzA-Vwqfoq4fTrXmW58WwHaDt?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [
      {
        'name': 'NCC Annual Training Camp',
        'description': 'The NCC Annual Training Camp is a 10–15 day residential program designed to instill discipline, leadership, and patriotism among cadets. It includes drill, physical training, cultural events, and social service activities.',
        'image': 'https://tse1.mm.bing.net/th/id/OIP.VhEjorsRVmxSls708alETQHaFw?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'March past',
        'description': 'March past is a ceremonial parade where cadets march in unison. '
            'It reflects discipline, timing, and team alignment. '
            'It is usually held during official college or national celebrations.',
        'image': 'https://images.hindustantimes.com/rf/image_size_640x362/HT/p1/2015/01/21/Incoming/Pictures/1309472_Wallpaper2.jpg',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Achievements',
        'description': "Aditya University's NCC unit has earned regional and state-level honors with cadets excelling in physical endurance, cultural events, and leadership activities. Their outstanding performance highlights their commitment to excellence.",
        'image': 'https://tse4.mm.bing.net/th/id/OIP.eFPGeX4I_SngAUNwHSXUlgHaE2?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
    ],
  },
  {
    'name': 'Festives',
    'image':
        'https://tse4.mm.bing.net/th/id/OIP.t3zusxWAUX6qMg1C65j44QHaE8?r=0&w=3000&h=2000&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [
      {
        'name': 'Varlaxmi Vratam',
        'description': 'This is a popular Hindu observance for women, praying for family well-being. '
            'It includes rituals, fasting, and decorating Kalasam with sacred items. '
            'It brings cultural unity and spiritual devotion.',
        'image': 'https://imgk.timesnownews.com/story/Varalakshmi_Vratham_puja.jpg?tr=w-1200,h-900',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Guru Purnima',
        'description': 'A spiritual event to pay respect to gurus and mentors. '
            'Students and teachers gather for prayers and cultural activities. '
            'It reinforces the traditional teacher-student bond.',
        'image': 'https://tse1.mm.bing.net/th/id/OIP.D0K7BTjf1D569obDFY4JfgAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Ganesh chaturdi',
        'description': 'Ganesh Chaturthi at Aditya University is celebrated with devotion and joy through idol installation, prayers, and cultural events, followed by a vibrant immersion procession.',
        'image': 'https://th.bing.com/th/id/R.c126c88e3b59d8da3631e6689381614b?rik=R4Wgveu1FcNMpw&riu=http%3a%2f%2fwww.ttitrends.com%2fwp-content%2fuploads%2f2017%2f08%2fGanesh-Chaturthi-OR-Vinayaka-Chaturthi.jpg&ehk=hwUHa%2b0TnFNZ%2f1XsEHuc782CrxEFUmUo0oziZ6iIZDU%3d&risl=&pid=ImgRaw&r=0',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Krishna astami',
        'description': 'Krishna Janmashtami at Aditya University is celebrated with devotional rituals and cultural performances, honoring Lord Krishna’s birth.',
        'image': 'https://tse1.mm.bing.net/th/id/OIP.Z88qUyOHRvjV65XmbnGLQQHaEO?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Navrathri',
        'description': 'Navratri at Aditya University is celebrated with vibrant dances, devotional songs, and rituals honoring Goddess Durga, bringing students and staff together in festive spirit.',
        'image': 'https://tse3.mm.bing.net/th/id/OIP.hh4MxgqtwslNDUafHLiXiQHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Diwali',
        'description': 'Diwali at Aditya University is celebrated with lights, cultural programs, and rituals that bring students and staff together in festive spirit.',
        'image': 'https://th.bing.com/th/id/R.3d2b2d536e2ab420acd38362e223b11d?rik=iD6Nc2W7efzi6w&riu=http%3a%2f%2fsites.lafayette.edu%2fisa%2ffiles%2f2014%2f10%2fDiwali-Diyas.jpg&ehk=yP9r8%2fBTWCSDn7oSLXkAMl%2brtxd8hArTjIQcpazMvo4%3d&risl=&pid=ImgRaw&r=0',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Christmas',
        'description': 'Christmas at Aditya University is celebrated with festive decorations, cultural performances, and community events that bring students and staff together in joy and unity.',
        'image': 'https://tse4.mm.bing.net/th/id/OIP.dZ20qw-k8FdZQmO-w4ZQFgHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location': LatLng(17.0910, 82.0699),
      },
    ],
  },
  {
    'name': 'NSS',
    'image':
        'https://tse3.mm.bing.net/th/id/OIP.H8Ko0d0AhOuA-eHrAue1wwHaHc?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [
      {
        'name': 'Camps',
        'description': 'NSS camps aim to promote social responsibility among students. '
            'They involve awareness drives, cleanliness programs, and workshops. '
            'These are held in rural areas for impactful community service.',
        'image': 'https://example.com/kho-kho.jpg',
        'location': LatLng(17.0910, 82.0699),
      },
      {
        'name': 'Wanted Volunteers',
        'description': 'A call to action for students to participate in social work. '
            'Opportunities range from blood donation drives to plantation programs. '
            'Volunteering helps build empathy and leadership.',
        'image':'https://example.com/kho-kho.jpg',
        'location':LatLng(17.0910, 82.0699),
      },
    ],
  },
    {
      'name': 'ASTEC CLUB',
    'image':
        'https://tse1.mm.bing.net/th/id/OIP.biZH1P3zUTqv1FffQR5EmwHaD8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [
      {
      'name':'ROBOTICS',
      'description': 'The Robotics Club at Aditya University encourages innovation through hands-on learning in designing, building, and programming robots. Students actively participate in robotics competitions, workshops, and tech expos, developing skills in AI, automation, and embedded systems.',
        'image':'https://tse1.mm.bing.net/th/id/OIP.8bXzEivezlYJySvslFZYJQHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location':LatLng(17.0910, 82.0699),
      },
      {
        'name':'ACHIEVEMENTS',
        'description':'The ASTEC Robotics Club at Aditya University Surampalem encourages hands-on innovation through projects such as Arduino‑based home automation, line‑followers, methane‑detecting drones, and smart waste management systems',
        'image':'https://tse1.mm.bing.net/th/id/OIP.q2kPXCvLvLbe_RRHb91XmgHaE7?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location':LatLng(17.0910, 82.0699),
      }
    ],
    },
    {
      'name': 'celebrations',
    'image':'https://tse2.mm.bing.net/th/id/OIP.EaCbJ6gidUcJ-Y7-PL6pbgHaE7?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [
      {
        'name':'VEDA',
        'description':"VEDA is the university’s flagship technical festival, aligned with Engineer’s Day on September 15th.It brings together students not only from Aditya University but also from neighboring colleges across Andhra Pradesh ",
        'image':'https://tse4.mm.bing.net/th/id/OIP.82ySgi_em1NCTHkFmL4xdgHaEu?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location':LatLng(17.0910, 82.0699),
      },
      {
        'name':'COLORS',
        'description':"COLORS is the annual cultural extravaganza of Aditya University, Surampalem, celebrated with vibrant performances, fashion shows, dances, and musical events. It brings together students from various disciplines to express their talents and foster unity through art, creativity, and tradition.",
        'image':'https://tse3.mm.bing.net/th/id/OIP.v4nzTvuU2dv6Atz88YwPyQHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location':LatLng(17.0910, 82.0699),
      },
    ],
    },
      {
        'name': 'FACULTY LIST',
    'image':
        'https://tse4.mm.bing.net/th/id/OIP.DIQm2G_6mtvaxiDmHEfS4wHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [{
       'name':'PHONE NUMBERS',
        'description':"This section provides the official phone numbers of faculty members for academic inquiries, mentorship guidance, and departmental communication. Students are encouraged to use these contacts respectfully during working hours for queries related to classes, projects, and university services.",
        'image':'https://tse1.mm.bing.net/th/id/OIP.NU_EoFrceH7qmiJMMtfkOQHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location':LatLng(17.0910, 82.0699),
    },
    {
      'name':'MAILS',
        'description':"This section provides the official mails of faculty members for academic inquiries, mentorship guidance, and departmental communication. Students are encouraged to use these contacts respectfully during working hours for queries related to classes, projects, and university services.",
        'image':'https://tse1.mm.bing.net/th/id/OIP.IpB5yPUkCFHOzlmM-O7ncAHaFW?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location':LatLng(17.0910, 82.0699),
    },
    ],
      },
    {
        'name': 'NOTICES',
    'image':
        'https://tse2.mm.bing.net/th/id/OIP.un5mhJ8CCaMonAaYCLMdVAHaEo?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    'competitions': [{
      'name':'NOTICES',
        'description':"This section displays all important updates, announcements, circulars, and event schedules related to academics, examinations, campus activities, and administrative information. Students and faculty are advised to check regularly to stay informed.",
        'image':'https://tse2.mm.bing.net/th/id/OIP.un5mhJ8CCaMonAaYCLMdVAHaEo?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        'location':LatLng(17.0910, 82.0699),
    },
    ],
    },
  ];

  

  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      events.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );
    _animations = _controllers
        .map((controller) =>
            CurvedAnimation(parent: controller, curve: Curves.easeInOut))
        .toList();
    _startAnimations();
  }

  void _startAnimations() async {
    for (var controller in _controllers) {
      await Future.delayed(const Duration(milliseconds: 100));
      controller.forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All The Events"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(events.length, (index) {
            final event = events[index];
            return ScaleTransition(
              scale: _animations[index],
              child: FadeTransition(
                opacity: _animations[index],
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EventDetailsPage(
                          eventName: event['name'],
                          competitions: List<Map<String, dynamic>>.from(event['competitions']),
                          imageUrl: event['image'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                event['image'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return Center(
                                      child: CircularProgressIndicator(
                                    value: progress.expectedTotalBytes != null
                                        ? progress.cumulativeBytesLoaded /
                                            progress.expectedTotalBytes!
                                        : null,
                                  ));
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.broken_image,
                                      size: 48, color: Colors.grey);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            event['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class EventDetailsPage extends StatefulWidget {
  final String eventName;
  final List<Map<String, dynamic>> competitions;
  final String imageUrl;

  const EventDetailsPage({
    super.key,
    required this.eventName,
    required this.competitions,
    required this.imageUrl,
  });

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<Offset>> _slideAnimations;
  late final List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimations = widget.competitions.map((competition) {
      int index = widget.competitions.indexOf(competition);
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            (index * 0.1).clamp(0.0, 1.0),
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      );
    }).toList();

    _fadeAnimations = widget.competitions.map((competition) {
      int index = widget.competitions.indexOf(competition);
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            (index * 0.1).clamp(0.0, 1.0),
            1.0,
            curve: Curves.easeIn,
          ),
        ),
      );
    }).toList();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCompetitionCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MyScreen(
              event: Event(
                title: widget.eventName,
                description: widget.competitions[index]['description'] ?? '',
                imageUrl: widget.competitions[index]['image'] ?? widget.imageUrl,
                location: 'Aditya College, Surampalem',
              ),
            ),
          ),
        );
      },
      child: SlideTransition(
        position: _slideAnimations[index],
        child: FadeTransition(
          opacity: _fadeAnimations[index],
          child: Card(
            elevation: 6,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.competitions[index]['name'],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.eventName),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image,
                    size: 100, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Competitions',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: widget.competitions.length,
              itemBuilder: (context, index) => _buildCompetitionCard(index),
            ),
          ),
        ],
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  final Event event;
  const MyScreen({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: IconButton(
                icon: const Icon(Icons.keyboard_arrow_left, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("Welcome to", style: const TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(event.title, style: const TextStyle(fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(event.imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 30),
                Text(
                  event.location,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(event.description),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Location",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter:
                          LatLng(17.090822778624798, 82.06965116128927),
                      initialZoom: 16,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.yourapp',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point:
                                LatLng(17.090822778624798, 82.06965116128927),
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.location_pin,
                              size: 40,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final String description;
  final String imageUrl;
  final String location;

  Event({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
  });
}