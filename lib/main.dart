import 'package:car_rent/providers/bookingp.dart';
import 'package:car_rent/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/history_page.dart';
import 'screens/booking_success_page.dart'; // kalau ada

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/start",
      routes: {
        "/start": (context) => const OnboardingPage(),
        "/home": (context) => const HomePage(),
        "/history": (context) => const HistoryPage(),
        // tambah route lain kalau perlu
      },
    );
  }
}
