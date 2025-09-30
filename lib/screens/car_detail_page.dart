import 'package:car_rent/screens/booking_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCarPage extends StatelessWidget {
  final String brand;
  final String name;
  final String price;
  final String assetPath;
  final String description;
  final List<Color> colors;
  final List<String> features;

  const DetailCarPage({
    super.key,
    required this.brand,
    required this.name,
    required this.price,
    required this.assetPath,
    required this.description,
    required this.colors,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0B11),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white54),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Gambar Mobil
            Center(child: Image.asset(assetPath, height: 280)),
            const SizedBox(height: 20),

            // Pilihan warna
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: colors.map((c) => _colorDot(c)).toList(),
            ),
            const SizedBox(height: 40),

            // Deskripsi
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Deskripsi",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Fitur
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Fitur",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 20,
              runSpacing: 20,

              children: features.map((f) => _featureChip(f)).toList(),
            ),
            const Spacer(),

            // Tombol Booking
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 160,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF484263), // Ungu
                        Color(0xFF4F5599),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor:
                          Colors.transparent, // biar gradient terlihat
                      shadowColor:
                          Colors.transparent, // hilangkan shadow default
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BookingDetailPage(),
                          ),
                        );
                      
                    },
                    child: Text(
                      "Booking",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorDot(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color,

        border: Border.all(color: Colors.white, width: 1),
      ),
    );
  }

  Widget _featureChip(String text) {
    return Chip(
      backgroundColor: const Color(0xff2E2C4D),

      label: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
