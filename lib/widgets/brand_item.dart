import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  final String assetPath;

  const BrandItem({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
      ),
      child: Center(
        child: Image.asset(assetPath, height: 30, color: Colors.white),
      ),
    );
  }
}
