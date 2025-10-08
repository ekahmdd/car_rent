import 'package:car_rent/screens/splash_screen.dart';
import 'package:car_rent/screens/home_page.dart';
import 'package:car_rent/screens/history_page.dart';
import 'package:car_rent/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart'; // ✅ For date formatting

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Required for async before runApp
  await initializeDateFormatting(
    'id_ID',
    null,
  ); // ✅ Initialize Indonesian locale

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/start",
          routes: {
            "/start": (context) => const OnboardingPage(),
            "/home": (context) => const HomePage(),
            "/history": (context) => const HistoryPage(),
            "/profile": (context) => const ProfilePage(),
          },
        );
      },
    );
  }
}
