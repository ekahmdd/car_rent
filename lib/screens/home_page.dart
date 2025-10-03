import 'package:car_rent/screens/notification_page.dart';
import 'package:car_rent/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/search_bar.dart';
import '../widgets/greeting_text.dart';
import '../widgets/banner_car.dart';
import '../widgets/brand_item.dart';
import '../widgets/car_item.dart';
import '../widgets/custom_navbar.dart';
import 'history_page.dart'; // 🔥 import HistoryPage

class Car {
  final String brand;
  final String name;
  final String price;
  final String assetPath;

  Car({
    required this.brand,
    required this.name,
    required this.price,
    required this.assetPath,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Car> cars = [
    Car(
      brand: "Toyota",
      name: "Toyota Prado",
      price: "1.200.000",
      assetPath: "assets/images/prado.png",
    ),
    Car(
      brand: "Honda",
      name: "Honda Civic",
      price: "1.000.000",
      assetPath: "assets/images/civic.png",
    ),
    Car(
      brand: "Suzuki",
      name: "Suzuki Swift",
      price: "800.000",
      assetPath: "assets/images/suzukiSwift.png",
    ),
    Car(
      brand: "Mercedes-Benz",
      name: "Mercy Luxury",
      price: "1.500.000",
      assetPath: "assets/images/MercyCar.png",
    ),
  ];

  List<Car> filteredCars = [];

  @override
  void initState() {
    super.initState();
    filteredCars = cars;
  }

  void _filterCars(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCars = cars;
      } else {
        filteredCars = cars
            .where(
              (car) => car.brand.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  /// 🔥 Halaman Home
  Widget _buildHomePage() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Color(0xFF484263), Color(0xff060908)],
              center: Alignment.centerRight,
              radius: 1.0,
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                SearchBarCustom(
                  controller: _searchController,
                  onChanged: _filterCars,
                ),
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

                Column(
                  children: filteredCars
                      .map(
                        (car) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CarItem(
                            name: car.name,
                            price: car.price,
                            assetPath: car.assetPath,
                            brand: car.brand,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePage(),
      const HistoryPage(), // 🔥 Booking History asli
      const NotificationPage(),
       const ProfilePage(),
    ];

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
