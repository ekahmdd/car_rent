import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarCustom extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBarCustom({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF323337),
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w200,
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Pencarian berdasarkan merk",
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(Icons.search, color: Colors.grey, size: 28),
        ),
      ),
    );
  }
}
