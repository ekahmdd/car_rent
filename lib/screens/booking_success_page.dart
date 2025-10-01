import 'package:car_rent/models/booking.dart';
import 'package:car_rent/providers/bookingp.dart';
import 'package:flutter/material.dart';

class BookingSuccessPage extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String paymentMethod;

  final String carName;
  final String brand;
  final String imagePath;
  final String price;

  const BookingSuccessPage({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.paymentMethod,
    required this.carName,
    required this.brand,
    required this.imagePath,
    required this.price,
  });

  String _formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E15),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // ✅ Simpan data mobil yang benar ke history
            BookingRepository.addHistory(
              BookingHistory(
                carName: carName,
                brand: brand,
                imagePath: imagePath,
                startDate: startDate,
                endDate: endDate,
                paymentMethod: paymentMethod,
              ),
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
        ),
        title: const Text("Detail", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 50),
              const SizedBox(height: 8),
              const Text(
                "Transaksi Berhasil",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),

              // ✅ Nama mobil yang benar
              Text(
                carName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.date_range, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text("${_formatDate(startDate)} - ${_formatDate(endDate)}"),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  const Icon(Icons.payment, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(paymentMethod),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
