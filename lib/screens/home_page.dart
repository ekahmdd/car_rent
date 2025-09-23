import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/search_bar.dart';
import '../widgets/greeting_text.dart';
import '../widgets/banner_car.dart';
import '../widgets/brand_item.dart';
import '../widgets/car_item.dart';
import '../widgets/custom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E15),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const SearchBarCustom(),
              const SizedBox(height: 40),

              const GreetingText(),
              const SizedBox(height: 40),

              const BannerCar(),
              const SizedBox(height: 20),

              Text(
                "Brand",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFBFBFCA),
                ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BrandItem(assetPath: "assets/images/honda.png"),
                  BrandItem(assetPath: "assets/images/suzuki.png"),
                  BrandItem(assetPath: "assets/images/mercy.png"),
                  BrandItem(assetPath: "assets/images/toyota.png"),
                ],
              ),
              const SizedBox(height: 30),

              Text(
                "Mobil yang tersedia",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFBFBFCA),
                ),
              ),
              const SizedBox(height: 12),

              const CarItem(
                name: "Toyota Fortuner",
                price: "1.200.000 / Hari",
                assetPath: "assets/cars/fortuner.png",
              ),
              const CarItem(
                name: "Mitsubishi Pajero",
                price: "1.400.000 / Hari",
                assetPath: "assets/cars/pajero.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
