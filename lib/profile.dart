import 'package:app4/main.dart';
import 'package:app4/mynotes.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyProfile extends StatefulWidget {
  final String name;
  const MyProfile({super.key, required this.name});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _logout() {
   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  void _goToNotes() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotesApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFEFF4FB),),
        child: SlideTransition(
          position: _offsetAnimation,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1502767089025-6572583495b4?auto=format&fit=crop&w=500&q=60',
                  ),
                  radius: 50,
                ),
                const SizedBox(height: 10),
                Text(widget.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                const Text("ramya@gmail.com", style: TextStyle(fontSize: 16, color: Colors.white70)),
                const SizedBox(height: 30),

                // 🔥 Pass callbacks properly here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCard(Icons.note, "Notes", Colors.green, _goToNotes),
                    _buildCard(Icons.logout, "Logout", Colors.red, _logout),
                  ],
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12, width: 2),
                      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text("Weekly Streak", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, _) {
                                      const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
                                      return Text(days[value.toInt() % days.length], style: const TextStyle(fontSize: 12));
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              borderData: FlBorderData(show: true),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(0, 2),
                                    FlSpot(1, 3),
                                    FlSpot(2, 5),
                                    FlSpot(3, 2.5),
                                    FlSpot(4, 4),
                                    FlSpot(5, 3),
                                    FlSpot(6, 4.5),
                                  ],
                                  isCurved: true,
                                  color: Colors.indigo,
                                  dotData: FlDotData(show: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: color.withOpacity(0.5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
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
              Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }
}
