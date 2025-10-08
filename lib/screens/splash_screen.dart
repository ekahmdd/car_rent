import 'package:car_rent/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/car_interior.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay gelap
          Container(color: Colors.black.withOpacity(0.4)),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),

                  // Title
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Goods",
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 47.sp,
                            color: const Color(0xff6E667E),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Problem",
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 48.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Sub Text
                  Center(
                    child: Text(
                      "Gunakan dan sewa kendaraan\ndengan nyaman",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        color: Colors.white70,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),

                  SizedBox(height: 50.h),

                  // Gradient Button
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Container(
                        width: 180.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff6E667E), // Ungu
                              Color(0xFF4F5599), // Biru keunguan
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Mulai",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
