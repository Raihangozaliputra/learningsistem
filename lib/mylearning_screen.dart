import 'package:flutter/material.dart';
import 'widgets/course_card.dart';
import 'course_detail_screen.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Green Gradient Header
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
              Text(
                'Kelas Saya',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Lanjutkan pembelajaranmu',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
              ),
              const SizedBox(height: 32),

              // Ongoing Courses Section (Kursus Khusus)
              Text(
                'Kursus Khusus',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  final List<Map<String, dynamic>> courses = [
                    {
                      'title': 'Flutter Mobile Development',
                      'category': 'MOBILE DEV',
                      'color': Colors.blue,
                      'progress': 0.65,
                      'duration': '12h 30m',
                    },
                    {
                      'title': 'Web Design Masterclass',
                      'category': 'DESIGN',
                      'color': Colors.purple,
                      'progress': 0.45,
                      'duration': '10h 15m',
                    },
                    {
                      'title': 'Python for Data Science',
                      'category': 'DATA SCIENCE',
                      'color': Colors.green,
                      'progress': 0.30,
                      'duration': '15h 45m',
                    },
                    {
                      'title': 'Backend with Node.js',
                      'category': 'BACKEND',
                      'color': Colors.orange,
                      'progress': 0.20,
                      'duration': '14h 10m',
                    },
                    {
                      'title': 'Advanced UI/UX Design',
                      'category': 'DESIGN',
                      'color': Colors.pink,
                      'progress': 0.15,
                      'duration': '8h 20m',
                    },
                    {
                      'title': 'Cloud Computing Basics',
                      'category': 'CLOUD',
                      'color': Colors.lightBlue,
                      'progress': 0.10,
                      'duration': '9h 50m',
                    },
                    {
                      'title': 'Cybersecurity Essentials',
                      'category': 'SECURITY',
                      'color': Colors.red,
                      'progress': 0.05,
                      'duration': '11h 00m',
                    },
                    {
                      'title': 'AI & Machine Learning',
                      'category': 'DATA SCIENCE',
                      'color': Colors.teal,
                      'progress': 0.0,
                      'duration': '20h 30m',
                    },
                  ];

                  final course = courses[index];
                  return CourseCard(
                    title: course['title'],
                    category: course['category'],
                    color: course['color'],
                    progress: course['progress'],
                    duration: course['duration'],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailScreen(
                          courseTitle: course['title'],
                          lecturer: '[ADY]',
                          courseCode: 'SM-${4200 + index}',
                        ),
                      ),
                    ),
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
