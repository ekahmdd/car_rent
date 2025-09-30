import 'package:flutter/material.dart';

class BookingSuccessPage extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String paymentMethod;

  const BookingSuccessPage({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.paymentMethod,
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
      appBar:AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      // ✅ balik ke HomePage & hapus stack sebelumnya
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
              // ✅ Icon & Title
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
              const SizedBox(height: 10),

              // ✅ Kode Transaksi
              const Text(
                "dfk3ds7df-943jk33",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),

              // ✅ Barcode dummy
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    "|||||||||||||||||||||",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ✅ Detail Pesanan
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Detail Pesanan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[900],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Tanggal + mobil
              Row(
                children: [
                  const Icon(Icons.date_range, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    "${_formatDate(startDate)} - ${_formatDate(endDate)}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Waktu Pengambilan
              Row(
                children: const [
                  Icon(Icons.access_time, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(child: Text("Waktu Pengambilan\nPukul 07:00 WIB")),
                ],
              ),
              const SizedBox(height: 12),

              // Waktu Pengembalian
              Row(
                children: const [
                  Icon(Icons.access_time_filled, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(child: Text("Waktu Pengembalian\nPukul 16:00 WIB")),
                ],
              ),
              const SizedBox(height: 16),

              // Metode Pembayaran
              Row(
                children: [
                  const Icon(Icons.payment, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(paymentMethod),
                ],
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 8),

              // ✅ Total Harga
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Rp 8.400.000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
