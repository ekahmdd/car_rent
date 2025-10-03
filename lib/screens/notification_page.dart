import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Notifikasi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar:
          true, // biar gradient naik ke atas sampai status bar
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0E0E15), Color(0xFF1B1B2F)],
            
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            16,
            100,
            16,
            16,
          ), // kasih jarak biar ga ketabrak AppBar
          children: [
            _buildNotificationCard(
              title: "Peringatan!!",
              message:
                  "Halo, batas pengembalian mobil seri Toyota Fortuner akan berakhir pada tanggal 4 Februari. Untuk itu segera disiapkan, ",
              backgroundColor: const Color(0xFF3D3C6D),
            ),
            const SizedBox(height: 12),
            _buildNotificationCard(
              title: "Pengumuman",
              message:
                  "Selamat tahun baru. Good Problem sedang ada promo menarik loh. Dengan potongan harga sebesar 30%. Ayo buruan, guna ",
              backgroundColor: const Color(0xFF3D3C6D),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title\n\n",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            TextSpan(
              text: message,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
