import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Using Scaffold to ensure background color matches
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifikasi',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Update terbaru untukmu',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: const Icon(Icons.mark_email_read_outlined, color: Color(0xFFB73E3E)),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Notification List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildNotificationItem(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(int index) {
    // Mock Data
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Modul Baru Tersedia',
        'message': 'Modul "State Management" telah ditambahkan ke kursus Flutter Mobile Development.',
        'time': 'Baru saja',
        'icon': Icons.book,
        'color': Colors.blue,
        'isRead': false,
      },
      {
        'title': 'Tugas Dinilai',
        'message': 'Tugas "UI Design Login" anda telah dinilai. Cek skor anda sekarang!',
        'time': '2 jam yang lalu',
        'icon': Icons.assignment_turned_in,
        'color': Colors.green,
        'isRead': false,
      },
      {
        'title': 'Pengingat Webinaar',
        'message': 'Jangan lupa webinar "Career in Tech" akan dimulai dalam 30 menit.',
        'time': '5 jam yang lalu',
        'icon': Icons.videocam,
        'color': Colors.purple,
        'isRead': true,
      },
      {
        'title': 'Promo Spesial!',
        'message': 'Dapatkan diskon 50% untuk semua kursus Premium hanya hari ini.',
        'time': '1 hari yang lalu',
        'icon': Icons.local_offer,
        'color': Colors.orange,
        'isRead': true,
      },
      {
        'title': 'Selamat Datang!',
        'message': 'Selamat bergabung di Learning Sistem! Mulai perjalanan belajarmu sekarang.',
        'time': '2 hari yang lalu',
        'icon': Icons.waving_hand,
        'color': const Color(0xFFB73E3E),
        'isRead': true,
      },
    ];

    final item = notifications[index];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item['isRead'] ? Colors.white : const Color(0xFFFFF5F5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: item['isRead'] ? null : Border.all(color: const Color(0xFFB73E3E).withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (item['color'] as Color).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['title'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: item['isRead'] ? Colors.black87 : const Color(0xFFB73E3E),
                        ),
                      ),
                    ),
                    Text(
                      item['time'] as String,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item['message'] as String,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
