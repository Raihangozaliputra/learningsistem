import 'package:flutter/material.dart';
import 'meeting_detail_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseTitle;
  final String courseCode;
  final String lecturer;

  const CourseDetailScreen({
    super.key,
    required this.courseTitle,
    this.courseCode = 'D4SM-42-03',
    this.lecturer = '[ADY]',
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7), // Light grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFFB73E3E), // Primary Red
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Dashboard Kelas ${widget.courseTitle}',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
            decoration: const BoxDecoration(
              color: Color(0xFFB73E3E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  '${widget.courseTitle.toUpperCase()}\n${widget.courseCode} ${widget.lecturer}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Custom Tab Bar Container
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.black87,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    tabs: const [
                      Tab(text: 'Materi'),
                      Tab(text: 'Tugas Dan Kuis'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Materi Tab
                _buildMeetingList(),
                // Tugas Tab (Placeholder same list for now)
                _buildMeetingList(isAssignment: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeetingList({bool isAssignment = false}) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: 12,
      itemBuilder: (context, index) {
        final meetingNum = index + 1;
        return _buildMeetingCard(meetingNum);
      },
    );
  }

  Widget _buildMeetingCard(int meetingNum) {
    // Dummy titles matching the image vibe
    final titles = [
      'Pengantar User Interface Design',
      'Konsep User Interface Design',
      'Interaksi pada User Interface Design',
      'Wireframing & Prototyping',
      'Typography & Color Theory',
      'Design System & Components',
      'Layout & Grid Systems',
      'Responsive Web Design',
      'Mobile App Design Guidelines',
      'Accessibility in Design',
      'Usability Testing Methods',
      'Final Project Presentation',
    ];

    final title = titles.length > meetingNum - 1 
        ? titles[meetingNum - 1] 
        : 'Topik Pertemuan $meetingNum';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeetingDetailScreen(
              meetingNum: meetingNum,
              title: title,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Pertemuan $meetingNum',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Title
            Text(
              '0$meetingNum - $title',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            
            // Meta info
            Row(
              children: [
                Text(
                  '3 URLs, 2 Files, 3 Interactive Content',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
