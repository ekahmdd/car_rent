import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerCar extends StatelessWidget {
  const BannerCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/images/honda_a.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.bottomLeft,
        child: Text(
          "Honda Accord\nGunakan kendaraan anda dengan mudah dan nyaman",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
    );
  }
}
