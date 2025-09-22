// Dummy HomePage
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "Selamat datang di Home Page 🚗",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
