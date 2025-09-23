import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF323337),
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.displayLarge,
          fontSize: 16,
          fontWeight: FontWeight.w200,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Pencarian",
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(Icons.search, color: Colors.grey, size: 28,),
        ),
      ),
    );
  }
}
