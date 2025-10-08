import 'package:car_rent/screens/notification_page.dart';
import 'package:car_rent/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_bar.dart';
import '../widgets/greeting_text.dart';
import '../widgets/banner_car.dart';
import '../widgets/brand_item.dart';
import '../widgets/car_item.dart';
import '../widgets/custom_navbar.dart';
import 'history_page.dart';

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

  /// 🔥 Halaman Home dengan Responsive Design
  Widget _buildHomePage() {
    // MediaQuery untuk mendapatkan ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

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
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 32.w : 16.w,
              vertical: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: isLandscape ? 10.h : 15.h),

                // Search Bar
                SearchBarCustom(
                  controller: _searchController,
                  onChanged: _filterCars,
                ),

                SizedBox(height: isLandscape ? 25.h : 40.h),

                // Greeting Text
                const GreetingText(),

                SizedBox(height: isLandscape ? 25.h : 40.h),

                // Banner Car
                const BannerCar(),

                SizedBox(height: 20.h),

                // Brand Section
                Text(
                  "Brand",
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 20.sp : 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFBFBFCA),
                  ),
                ),

                SizedBox(height: 12.h),

                // Brand Items - Responsive Grid
                isTablet
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          BrandItem(assetPath: "assets/images/honda.png"),
                          BrandItem(assetPath: "assets/images/suzuki.png"),
                          BrandItem(assetPath: "assets/images/mercy.png"),
                          BrandItem(assetPath: "assets/images/toyota.png"),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          BrandItem(assetPath: "assets/images/honda.png"),
                          BrandItem(assetPath: "assets/images/suzuki.png"),
                          BrandItem(assetPath: "assets/images/mercy.png"),
                          BrandItem(assetPath: "assets/images/toyota.png"),
                        ],
                      ),

                SizedBox(height: isLandscape ? 20.h : 30.h),

                // Available Cars Section
                Text(
                  "Mobil yang tersedia",
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 18.sp : 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFBFBFCA),
                  ),
                ),

                SizedBox(height: 12.h),

                // Car List - Responsive Layout
                isTablet
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isLandscape ? 3 : 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: filteredCars.length,
                        itemBuilder: (context, index) {
                          final car = filteredCars[index];
                          return CarItem(
                            name: car.name,
                            price: car.price,
                            assetPath: car.assetPath,
                            brand: car.brand,
                          );
                        },
                      )
                    : Column(
                        children: filteredCars
                            .map(
                              (car) => Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
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

                // Extra bottom padding
                SizedBox(height: 20.h),
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
      const HistoryPage(),
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
