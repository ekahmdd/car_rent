import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hallo!\nMau sewa unit yang mana?",
      style: GoogleFonts.inter(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xFFBFBFCA),
      ),
    );
  }
}
