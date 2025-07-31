import 'package:flutter/material.dart';
class MyProfile extends StatefulWidget {
  String name;
   MyProfile({super.key,required this.name});

  @override
  State<MyProfile> createState() => _MyAppState();
}

class _MyAppState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.indigo,),
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1502767089025-6572583495b4?auto=format&fit=crop&w=500&q=60',
                    ),
                    radius: 50,
                  ),
                ),
                const SizedBox(height: 10),
                 Center(child: Text(widget.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                Center(child: Text("9515204789", style: TextStyle(fontSize: 16))),
                Center(child: Text("ramya@gmail.com", style: TextStyle(fontSize: 16))),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCard(Icons.punch_clock, "Remainders", Colors.red),
                    _buildCard(Icons.star, "Achievements", Colors.amber),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCard(Icons.settings, "Settings", Colors.blue),
                    _buildCard(Icons.logout, "Logout", Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(IconData icon, String label, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: color.withOpacity(0.5),
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        width: 140,
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
