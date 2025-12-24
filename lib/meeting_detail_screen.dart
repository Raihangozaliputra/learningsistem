import 'package:flutter/material.dart';

class MeetingDetailScreen extends StatelessWidget {
  final int meetingNum;
  final String title;

  const MeetingDetailScreen({
    super.key,
    required this.meetingNum,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // Very light grey
      appBar: AppBar(
        title: Text('Pertemuan $meetingNum'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 16),
            
            // Description Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Pada pertemuan ini, kita akan mempelajari prinsip-prinsip dasar dari User Interface (UI) Design. Kita akan membahas elemen-elemen visual, hierarki, dan tata letak yang baik untuk menciptakan pengalaman pengguna yang optimal.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Materi Section
            Text(
              'Lampiran Materi',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            _buildMaterialItem(
              icon: Icons.picture_as_pdf, 
              color: Colors.red.shade400,
              title: 'Slide Presentasi.pdf',
              subtitle: '2.4 MB',
            ),
            const SizedBox(height: 12),
            _buildMaterialItem(
              icon: Icons.link, 
              color: Colors.blue.shade400,
              title: 'Referensi Artikel UI/UX',
              subtitle: 'medium.com',
            ),
            const SizedBox(height: 12),
            _buildMaterialItem(
              icon: Icons.video_library, 
              color: Colors.red.shade600,
              title: 'Rekaman Zoom Meeting',
              subtitle: '1h 30m',
            ),

            const SizedBox(height: 32),

            // Tugas / Kuis Section
            Text(
              'Tugas & Kuis',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.assignment, color: Colors.orange),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Analisis UI Aplikasi Favorit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tenggat: 20 Des 2025, 23:59',
                              style: TextStyle(
                                color: Colors.red[400],
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'Silakan buat dokumen analisis mengenai prinsip desain pada aplikasi favorit Anda. Sertakan screenshot dan penjelasan poin-poin penting.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Upload Area
                  InkWell(
                    onTap: () {
                      // Handle upload
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          style: BorderStyle.none, // Changed to none to avoid conflict with dashed border implementation if I had one, but standard border is fine.
                        ),
                      ),
                      // Using CustomPaint for dashed border would be ideal but let's stick to simple first or use a package.
                      // Let's emulate dashed border with a simple workaround or just solid for now to correspond to "minimalist".
                      // Actually a solid border with grey color is fine.
                      child: Column(
                        children: [
                          Icon(Icons.cloud_upload_outlined, size: 32, color: Colors.blue[600]),
                          const SizedBox(height: 12),
                          Text(
                            'Tap untuk upload tugas',
                            style: TextStyle(
                              color: Colors.blue[600],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'PDF, DOCX, atau JPG (Max 10MB)',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.download_rounded, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
