import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarItem extends StatelessWidget {
  final String brand;
  final String name;
  final String price;
  final String assetPath;

  const CarItem({
    super.key,
    required this.brand,
    required this.name,
    required this.price,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 160,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E2C4D), Color(0xFF3B487E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Konten kiri (brand, nama, ikon)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Color(0xFF2E2C4D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    brand,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Price container full width di bawah
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xff3A4879),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "/ Hari",
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Mobil di depan price
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(30, 10), // biar naik sedikit ke atas price
                child: Image.asset(assetPath, height: 160, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
