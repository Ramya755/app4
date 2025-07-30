import 'package:flutter/material.dart';

class Mynote2 extends StatefulWidget {
  const Mynote2({super.key});

  @override
  State<Mynote2> createState() => _Mynote2State();
}

class _Mynote2State extends State<Mynote2> {
  final TextEditingController noteController = TextEditingController();
  String selectedDate = '';
  String selectedTime = '';

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  void pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked.format(context);
      });
    }
  }

  void saveNote() {
    if (noteController.text.isNotEmpty &&
        selectedDate.isNotEmpty &&
        selectedTime.isNotEmpty) {
      Navigator.pop(context, {
        'note': noteController.text,
        'date': selectedDate,
        'time': selectedTime,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4F4),
      appBar: AppBar(
        title: const Text("Add Note", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              shadowColor: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Date & Time Row (Top-Right aligned)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: pickDate,
                          icon: const Icon(Icons.calendar_today, size: 18),
                          label: Text(
                            selectedDate.isEmpty ? "Pick Date" : selectedDate,
                            style: const TextStyle(fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade400,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: pickTime,
                          icon: const Icon(Icons.access_time, size: 18),
                          label: Text(
                            selectedTime.isEmpty ? "Pick Time" : selectedTime,
                            style: const TextStyle(fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo.shade400,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Note TextField
                    TextField(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                      controller: noteController,
                      decoration: InputDecoration(
                        labelText: "Write your note here",
                        labelStyle: const TextStyle(color: Colors.indigo),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: saveNote,
              icon: const Icon(Icons.save),
              label: const Text("Save Note"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
