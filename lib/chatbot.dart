import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget 
{
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