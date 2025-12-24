import 'package:flutter/material.dart';
import 'widgets/course_card.dart';
import 'course_detail_screen.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Kelas Saya',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lanjutkan pembelajaranmu',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
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
            itemCount: 4,
            itemBuilder: (context, index) {
              // Mock data for special courses
              if (index == 0) {
                return CourseCard(
                  title: 'Advanced Flutter Architecture',
                  category: 'MOBILE DEV',
                  color: Colors.blue,
                  progress: 0.15,
                  duration: '8h 45m',
                  rating: 4.9,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CourseDetailScreen(
                        courseTitle: 'Advanced Flutter Architecture',
                        lecturer: '[ADY]', 
                        courseCode: 'D4SM-42-03',
                      ),
                    ),
                  ),
                );
              } else if (index == 1) {
                return CourseCard(
                  title: 'UI/UX Design Principles',
                  category: 'DESIGN',
                  color: Colors.purple,
                  progress: 0.30,
                  duration: '6h 20m',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CourseDetailScreen(
                        courseTitle: 'UI/UX Design Principles',
                        lecturer: '[ADY]',
                        courseCode: 'D4SM-42-03',
                      ),
                    ),
                  ),
                );
              } else if (index == 2) {
                return CourseCard(
                  title: 'Backend with Node.js',
                  category: 'BACKEND',
                  color: Colors.green,
                  progress: 0.05,
                  duration: '14h 10m',
                   onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CourseDetailScreen(
                        courseTitle: 'Backend with Node.js',
                        lecturer: '[ADY]',
                        courseCode: 'D4SM-42-03',
                      ),
                    ),
                  ),
                );
              }
              return CourseCard(
                title: 'Data Analysis with Python',
                category: 'DATA SCIENCE',
                color: Colors.orange,
                progress: 0.0,
                duration: '10h 30m',
                 onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CourseDetailScreen(
                        courseTitle: 'Data Analysis with Python',
                        lecturer: '[ADY]',
                        courseCode: 'D4SM-42-03',
                      ),
                    ),
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}
