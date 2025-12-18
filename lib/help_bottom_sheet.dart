import 'package:flutter/material.dart';

class HelpBottomSheet extends StatefulWidget {
  const HelpBottomSheet({super.key});

  @override
  State<HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<HelpBottomSheet> {
  bool isIndonesian = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            
            // Language Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() => isIndonesian = true),
                  child: Column(
                    children: [
                      Text(
                        'ID',
                        style: TextStyle(
                          fontWeight: isIndonesian ? FontWeight.bold : FontWeight.normal,
                          color: isIndonesian ? const Color(0xFFB73E3E) : Colors.black,
                        ),
                      ),
                      if (isIndonesian)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: const Color(0xFFB73E3E),
                        )
                      else
                        const SizedBox(height: 6),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () => setState(() => isIndonesian = false),
                  child: Column(
                    children: [
                      Text(
                        'EN',
                        style: TextStyle(
                          fontWeight: !isIndonesian ? FontWeight.bold : FontWeight.normal,
                          color: !isIndonesian ? const Color(0xFFB73E3E) : Colors.black,
                        ),
                      ),
                      if (!isIndonesian)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: const Color(0xFFB73E3E),
                        )
                      else
                        const SizedBox(height: 6),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
    
            // Content
            _buildContent(),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isIndonesian) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Akses hanya untuk Dosen dan Mahasiswa Telkom University.',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut :',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id"\nPassword (Akun iGracias) pada kolom Password.',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'Kegagalan yang terjadi pada Autentikasi disebabkan oleh Anda belum mengubah Password Anda menjadi "Strong Password". Pastikan Anda telah melakukan perubahan Password di iGracias.',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 8),
          Text('Mail : infoceloe@telkomuniversity.ac.id'),
          Text('whatsapp : +62 821-1666-3563'),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Access restricted only for Lecturer and Student of Telkom University',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'Login only using your Microsoft Office 365 Account by following these format :',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'Username (iGracias Account) followed with "@365.telkomuniversity.ac.id"\nPassword (SSO / iGracias Account) on Password Field.',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'Failure upon Authentication could be possibly you have not yet change your password into "Strong Password". Make sure to change your Password only in iGracias.',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 16),
          Text(
            'For further information, please contact CeLOE Service Helpdesk :',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 8),
          Text('mail : infoceloe@telkomuniversity.ac.id'),
          Text('whatsapp : +62 821-1666-3563'),
        ],
      );
    }
  }
}
