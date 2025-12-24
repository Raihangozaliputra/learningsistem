import 'package:flutter/material.dart';
import 'announcement_detail_screen.dart';
import 'profile_screen.dart';
import 'mylearning_screen.dart';
import 'notification_screen.dart';
import 'widgets/course_card.dart';
import 'deadline_list_screen.dart';
import 'schedule_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    MyLearningScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
        indicatorColor: const Color(0xFF4CAF50).withOpacity(0.2),
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Color(0xFF4CAF50)),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book, color: Color(0xFF4CAF50)),
            icon: Icon(Icons.book_outlined),
            label: 'Kelas Saya',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications, color: Color(0xFF4CAF50)),
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifikasi',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Color(0xFF4CAF50)),
            icon: Icon(Icons.person_outline),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Green Gradient Header Background
        Container(
          height: 180,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF66BB6A), Color(0xFF81C784)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, Mahasiswa',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Selamat datang kembali!',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFF4CAF50)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari kursus...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Dashboard Stats Grid (Even Smaller & Compact)
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ScheduleScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.book, color: Colors.blue, size: 18),
                            const SizedBox(width: 8),
                            const Text(
                              '8',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Matakuliah',
                              style: TextStyle(color: Colors.grey[600], fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DeadlineListScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.assignment, color: Colors.orange, size: 18),
                            const SizedBox(width: 8),
                            const Text(
                              '8',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Deadline',
                              style: TextStyle(color: Colors.grey[600], fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Attendance Section (Compact)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.verified, color: Color(0xFF4CAF50), size: 20),
                    const SizedBox(width: 10),
                    const Text(
                      'Kehadiran:',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      '92%',
                      style: TextStyle(color: Color(0xFF4CAF50), fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Class Schedule & Deadline Details
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScheduleScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.withOpacity(0.08)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.timer, color: Colors.green, size: 18),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'Masuk Kelas: Senin, 08:00 WIB',
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('R. 402', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1, thickness: 0.5),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DeadlineListScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 18),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                'Tugas: Mobile Flutter Dev (Besok)',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Latest Announcement Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pengumuman Terbaru',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat Semua', style: TextStyle(color: Color(0xFF4CAF50), fontSize: 13)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final colors = [
                      [const Color(0xFF4285F4), const Color(0xFF34A853)],
                      [const Color(0xFFFBBC05), const Color(0xFFEA4335)],
                      [const Color(0xFF673AB7), const Color(0xFF9C27B0)],
                    ];
                    final titles = [
                      'Workshop UI/UX Bersama Google',
                      'Lomba Karya Tulis Nasional',
                      'Beasiswa Unggulan Smt Ganjil',
                    ];
                    final dates = ['25 Des', ' 2 Jan', '10 Jan'];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnnouncementDetailScreen(
                              title: titles[index],
                              date: dates[index],
                              colors: colors[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 260,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: colors[index],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dates[index],
                              style: const TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                            Text(
                              titles[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Klik untuk detail',
                              style: TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Categories Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat Semua', style: TextStyle(color: Color(0xFF4CAF50), fontSize: 13)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryItem(icon: Icons.code_rounded, label: 'Coding', color: Colors.blue),
                  CategoryItem(icon: Icons.palette_outlined, label: 'Design', color: Colors.purple),
                  CategoryItem(icon: Icons.corporate_fare_rounded, label: 'Business', color: Colors.orange),
                  CategoryItem(icon: Icons.biotech_rounded, label: 'Science', color: Colors.green),
                ],
              ),
              const SizedBox(height: 32),

              // Popular Courses
              const Text(
                'Kursus Populer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const CourseCard(
                      title: 'Flutter Mobile Development',
                      progress: 0.65,
                    );
                  } else if (index == 1) {
                    return const CourseCard(
                      title: 'Web Design Masterclass',
                      category: 'DESIGN',
                      color: Colors.purple,
                      progress: 0.45,
                    );
                  }
                  return const CourseCard(
                    title: 'Python for Data Science',
                    category: 'DATA SCIENCE',
                    color: Colors.green,
                    progress: 0.30,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ],
    );
  }
}


