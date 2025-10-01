import 'package:car_rent/providers/bookingp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final histories = BookingRepository.histories;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E15),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Riwayat Pesanan",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: histories.isEmpty
          ? const Center(
              child: Text(
                "Belum ada riwayat",
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: histories.length,
              itemBuilder: (context, index) {
                final item = histories[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E2C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Image.asset(item.imagePath, width: 80),
                    title: Text(
                      item.carName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${DateFormat('dd MMM').format(item.startDate)} - "
                      "${DateFormat('dd MMM').format(item.endDate)}\n"
                      "Metode: ${item.paymentMethod}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                      ),
                      onPressed: () {
                        // 🔥 Bisa buat repeat order di sini
                      },
                      child: const Text("Pesan Lagi"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
