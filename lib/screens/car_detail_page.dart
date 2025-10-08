import 'package:car_rent/screens/booking_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCarPage extends StatefulWidget {
  final String brand;
  final String name;
  final String price;
  final String assetPath;
  final String description;
  final List<Color> colors;
  final List<String> features;

  const DetailCarPage({
    super.key,
    required this.brand,
    required this.name,
    required this.price,
    required this.assetPath,
    required this.description,
    required this.colors,
    required this.features,
  });

  @override
  State<DetailCarPage> createState() => _DetailCarPageState();
}

class _DetailCarPageState extends State<DetailCarPage> {
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color(0xff0B0B11),
      body: CustomScrollView(
        slivers: [
          // AppBar yang lebih menarik
          SliverAppBar(
            expandedHeight: isTablet ? 400.h : 320.h,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xff0B0B11),
            leading: Container(
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: isTablet ? 22.sp : 20.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: isTablet ? 22.sp : 20.sp,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF484263).withOpacity(0.3),
                      const Color(0xff0B0B11),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.h),
                    // Gambar Mobil dengan Hero Animation
                    Hero(
                      tag: widget.assetPath,
                      child: Image.asset(
                        widget.assetPath,
                        height: isTablet ? 280.h : 220.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff0B0B11),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 32.w : 20.w,
                  vertical: 24.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header dengan nama dan harga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.brand.toUpperCase(),
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 14.sp : 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF4F5599),
                                  letterSpacing: 1.5,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                widget.name,
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 28.sp : 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF484263), Color(0xFF4F5599)],
                            ),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Rp ${widget.price}",
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 18.sp : 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "per hari",
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 12.sp : 10.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    // Pilihan warna dengan animasi
                    Text(
                      "Pilih Warna",
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 18.sp : 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: List.generate(
                        widget.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: EdgeInsets.only(right: 12.w),
                            width: selectedColorIndex == index
                                ? isTablet
                                      ? 42.w
                                      : 38.w
                                : isTablet
                                ? 36.w
                                : 32.w,
                            height: selectedColorIndex == index
                                ? isTablet
                                      ? 42.w
                                      : 38.w
                                : isTablet
                                ? 36.w
                                : 32.w,
                            decoration: BoxDecoration(
                              color: widget.colors[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedColorIndex == index
                                    ? Colors.white
                                    : Colors.white30,
                                width: selectedColorIndex == index ? 2.w : 1.w,
                              ),
                              boxShadow: selectedColorIndex == index
                                  ? [
                                      BoxShadow(
                                        color: widget.colors[index].withOpacity(
                                          0.5,
                                        ),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : [],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // Deskripsi dengan card
                    Container(
                      padding: EdgeInsets.all(isTablet ? 20.w : 16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xff1A1A24),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.05),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.description_outlined,
                                color: const Color(0xFF4F5599),
                                size: isTablet ? 22.sp : 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "Deskripsi",
                                style: GoogleFonts.poppins(
                                  fontSize: isTablet ? 18.sp : 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            widget.description,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: isTablet ? 15.sp : 14.sp,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Fitur dengan grid layout
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: const Color(0xFF4F5599),
                          size: isTablet ? 22.sp : 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Fitur Unggulan",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 18.sp : 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: widget.features.map((feature) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isTablet ? 18.w : 14.w,
                            vertical: isTablet ? 12.h : 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff1A1A24),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: const Color(0xFF4F5599).withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: isTablet ? 8.w : 6.w,
                                height: isTablet ? 8.w : 6.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF484263),
                                      Color(0xFF4F5599),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                feature,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: isTablet ? 15.sp : 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 40.h),

                    // Tombol Booking yang lebih menarik
                    Container(
                      width: double.infinity,
                      height: isTablet ? 60.h : 55.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF484263), Color(0xFF4F5599)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4F5599).withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDetailPage(
                                carName: widget.name,
                                brand: widget.brand,
                                imagePath: widget.assetPath,
                                price: widget.price,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Booking Sekarang",
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 18.sp : 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: isTablet ? 24.sp : 22.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
