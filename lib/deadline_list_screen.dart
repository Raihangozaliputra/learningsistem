import 'package:flutter/material.dart';
import 'meeting_detail_screen.dart';

class DeadlineListScreen extends StatelessWidget {
  const DeadlineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> deadlines = [
      {
        'title': 'Tugas: Mobile Flutter Dev',
        'course': 'Flutter Mobile Development',
        'deadline': 'Besok, 23:59 WIB',
        'isNear': true,
        'meetingNum': 8,
      },
      {
        'title': 'Analisis UI/UX Aplikasi',
        'course': 'Web Design Masterclass',
        'deadline': '27 Des 2025, 21:00 WIB',
        'isNear': false,
        'meetingNum': 5,
      },
      {
        'title': 'Laporan Basis Data',
        'course': 'Database System',
        'deadline': '28 Des 2025, 23:59 WIB',
        'isNear': false,
        'meetingNum': 10,
      },
      {
        'title': 'Quiz: Algoritma Lanjut',
        'course': 'Algorithm & Logic',
        'deadline': '29 Des 2025, 10:00 WIB',
        'isNear': false,
        'meetingNum': 12,
      },
      {
        'title': 'Proyek Akhir Semester',
        'course': 'Mobile Programming',
        'deadline': '30 Des 2025, 23:59 WIB',
        'isNear': false,
        'meetingNum': 14,
      },
      {
        'title': 'Tugas Mandiri 3',
        'course': 'Human Computer Interaction',
        'deadline': '31 Des 2025, 20:00 WIB',
        'isNear': false,
        'meetingNum': 7,
      },
      {
        'title': 'Review Jurnal Internasional',
        'course': 'Metodologi Penelitian',
        'deadline': '2 Jan 2026, 23:59 WIB',
        'isNear': false,
        'meetingNum': 4,
      },
      {
        'title': 'Implementasi API',
        'course': 'Back-end Specialist',
        'deadline': '5 Jan 2026, 23:59 WIB',
        'isNear': false,
        'meetingNum': 9,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Daftar Deadline Tugas', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: deadlines.length,
        itemBuilder: (context, index) {
          final item = deadlines[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (item['isNear'] as bool) ? Colors.red.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.assignment,
                  color: (item['isNear'] as bool) ? Colors.red : Colors.orange,
                ),
              ),
              title: Text(
                item['title'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    item['course'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: (item['isNear'] as bool) ? Colors.red : Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        item['deadline'],
                        style: TextStyle(
                          color: (item['isNear'] as bool) ? Colors.red : Colors.grey,
                          fontSize: 12,
                          fontWeight: (item['isNear'] as bool) ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MeetingDetailScreen(
                      meetingNum: item['meetingNum'],
                      title: item['title'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
