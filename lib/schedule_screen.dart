import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> schedule = [
      {
        'day': 'Senin',
        'subjects': [
          {'time': '08:00 - 10:30', 'title': 'Flutter Mobile Development', 'room': 'Lab 402', 'color': Colors.blue},
          {'time': '13:00 - 15:30', 'title': 'Web Design Masterclass', 'room': 'Lab 101', 'color': Colors.purple},
        ]
      },
      {
        'day': 'Selasa',
        'subjects': [
          {'time': '08:00 - 10:30', 'title': 'Python for Data Science', 'room': 'Lab 205', 'color': Colors.green},
          {'time': '10:45 - 13:15', 'title': 'Human Computer Interaction', 'room': 'R. 302', 'color': Colors.pink},
        ]
      },
      {
        'day': 'Rabu',
        'subjects': [
          {'time': '09:00 - 11:30', 'title': 'Backend with Node.js', 'room': 'Lab 303', 'color': Colors.orange},
        ]
      },
      {
        'day': 'Kamis',
        'subjects': [
          {'time': '08:00 - 10:30', 'title': 'Cloud Computing Basics', 'room': 'Lab 405', 'color': Colors.lightBlue},
          {'time': '13:00 - 15:30', 'title': 'Cybersecurity Essentials', 'room': 'R. 201', 'color': Colors.red},
        ]
      },
      {
        'day': 'Jumat',
        'subjects': [
          {'time': '14:00 - 16:30', 'title': 'AI & Machine Learning', 'color': Colors.teal, 'room': 'Lab 202'},
        ]
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Jadwal Kuliah', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final dayData = schedule[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Text(
                  dayData['day'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
              ...((dayData['subjects'] as List).map((subject) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 40,
                        decoration: BoxDecoration(
                          color: subject['color'],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subject['title'],
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${subject['time']} | ${subject['room']}',
                              style: TextStyle(color: Colors.grey[600], fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_vert, color: Colors.grey, size: 20),
                    ],
                  ),
                );
              }).toList()),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }
}
