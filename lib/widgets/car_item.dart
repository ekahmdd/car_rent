import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarItem extends StatelessWidget {
  final String name;
  final String price;
  final String assetPath;

  const CarItem({
    super.key,
    required this.name,
    required this.price,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C27),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(price, style: GoogleFonts.poppins(color: Colors.grey)),
              ],
            ),
          ),
          Image.asset(assetPath, height: 70),
        ],
      ),
    );
  }
}
