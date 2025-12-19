import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Center(child: Text('Kelas Saya', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('Notifikasi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
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
        indicatorColor: const Color(0xFFB73E3E).withOpacity(0.2),
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Color(0xFFB73E3E)),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book, color: Color(0xFFB73E3E)),
            icon: Icon(Icons.book_outlined),
            label: 'Kelas Saya',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications, color: Color(0xFFB73E3E)),
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifikasi',
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
    return SingleChildScrollView(
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
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Selamat datang kembali!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
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
                  backgroundColor: Color(0xFFB73E3E),
                  child: Icon(Icons.person, color: Colors.white),
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
                borderSide: const BorderSide(color: Color(0xFFB73E3E), width: 1),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Dashboard Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFB73E3E), Color(0xFFD95E5E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB73E3E).withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Progress Belajar',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '85% Selesai',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 0.85,
                        backgroundColor: Colors.white24,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.trending_up, color: Colors.white, size: 32),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Categories Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kategori',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat Semua', style: TextStyle(color: Color(0xFFB73E3E))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryItem(icon: Icons.code, label: 'Coding', color: Colors.blue),
              CategoryItem(icon: Icons.design_services, label: 'Design', color: Colors.purple),
              CategoryItem(icon: Icons.business, label: 'Business', color: Colors.orange),
              CategoryItem(icon: Icons.science, label: 'Science', color: Colors.green),
            ],
          ),
          const SizedBox(height: 32),

          // Popular Courses
          Text(
            'Kursus Populer',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
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

class CourseCard extends StatelessWidget {
  final String title;
  final String category;
  final Color color;
  final double rating;
  final String duration;
  final double? progress;

  const CourseCard({
    super.key,
    this.title = 'Flutter Mobile Development',
    this.category = 'DEVELOPMENT',
    this.color = const Color(0xFFB73E3E),
    this.rating = 4.8,
    this.duration = '12h 30m',
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/80'), // Placeholder
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: color,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber[700]),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.access_time, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress Belajar',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${(progress! * 100).toInt()}%',
                      style: const TextStyle(
                        color: Color(0xFFB73E3E),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB73E3E)),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
