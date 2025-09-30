import 'package:car_rent/screens/booking_success_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingDetailPage extends StatefulWidget {
  const BookingDetailPage({super.key});

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  DateTime? startDate;
  DateTime? endDate;
  String? paymentMethod;

  final List<String> paymentOptions = [
    "BRI Virtual",
    "BCA Virtual",
    "Mandiri Virtual",
    "Gopay",
    "OVO",
  ];

  Future<void> _pickDate({required bool isStart}) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2022, 1, 1);
    DateTime lastDate = DateTime(2030, 12, 31);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart
          ? (startDate ?? initialDate)
          : (endDate ?? initialDate),
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF6C63FF),
              onPrimary: Colors.white,
              surface: Color(0xFF1E1E2C),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: const Color(0xFF2C2C3E),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
          if (endDate != null && endDate!.isBefore(startDate!)) {
            endDate = null;
          }
        } else {
          endDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Pilih tanggal";
    return DateFormat("dd MMMM yyyy").format(date);
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
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Detail", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Dari", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _pickDate(isStart: true),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E2C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDate(startDate),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(Icons.edit_calendar, color: Colors.white70),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sampai dengan",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _pickDate(isStart: false),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E2C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDate(endDate),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(Icons.edit_calendar, color: Colors.white70),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Metode Pembayaran",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              dropdownColor: const Color(0xFF1E1E2C),
              value: paymentMethod,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E2C),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: paymentOptions.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(
                    method,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  paymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: const [
                  Icon(Icons.account_circle, size: 80, color: Colors.white70),
                  SizedBox(height: 10),
                  Text(
                    "Silahkan poto wajah anda sebagai bentuk verifikasi data",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (startDate != null &&
                  endDate != null &&
                  paymentMethod != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingSuccessPage(
                      startDate: startDate!,
                      endDate: endDate!,
                      paymentMethod: paymentMethod!,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Harap isi semua data")),
                );
              }
            },
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF3A2FCD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Konfirmasi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
