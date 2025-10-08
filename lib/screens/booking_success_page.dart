import 'package:car_rent/models/booking.dart';
import 'package:car_rent/providers/bookingp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookingSuccessPage extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String paymentMethod;
  final String carName;
  final String brand;
  final String imagePath;
  final String price;

  const BookingSuccessPage({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.paymentMethod,
    required this.carName,
    required this.brand,
    required this.imagePath,
    required this.price,
  });

  int _calculateDays() {
    return endDate.difference(startDate).inDays + 1;
  }

  int _calculateTotalPrice() {
    int pricePerDay = int.parse(price.replaceAll(RegExp(r'\.'), ''));
    return pricePerDay * _calculateDays();
  }

  String _formatRupiah(int amount) {
    return NumberFormat("#,###", "id_ID").format(amount).replaceAll(",", ".");
  }

  String _formatDate(DateTime date) {
    const months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  // Method untuk menentukan ukuran font berdasarkan screen size
  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Gunakan lebar layar sebagai acuan utama
    if (screenWidth < 320) {
      return baseSize * 0.8; // Very small phones
    } else if (screenWidth < 375) {
      return baseSize * 0.9; // Small phones
    } else if (screenWidth > 600) {
      return baseSize * 1.3; // Tablets
    } else {
      return baseSize; // Normal phones
    }
  }

  // Method untuk menentukan padding/margin berdasarkan screen size
  double _getResponsiveSpacing(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 320) {
      return baseSize * 0.7;
    } else if (screenWidth < 375) {
      return baseSize * 0.85;
    } else if (screenWidth > 600) {
      return baseSize * 1.4;
    } else {
      return baseSize;
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = _calculateTotalPrice();
    final formattedTotal = "Rp ${_formatRupiah(totalAmount)}";

    // Dapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 375;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B11),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: isSmallScreen ? 18.sp : 20.sp,
          ),
          onPressed: () {
            BookingRepository.addHistory(
              BookingHistory(
                carName: carName,
                brand: brand,
                imagePath: imagePath,
                startDate: startDate,
                endDate: endDate,
                paymentMethod: paymentMethod,
                totalPrice: formattedTotal,
                price: price,
                description: '',
                colors: [],
                features: [],
              ),
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
        ),
        title: Text(
          "Booking Berhasil",
          style: GoogleFonts.poppins(
            fontSize: isSmallScreen ? 16.sp : 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _getResponsiveSpacing(context, 20).w,
              vertical: _getResponsiveSpacing(context, 16).h,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(_getResponsiveSpacing(context, 24).w),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A24),
                borderRadius: BorderRadius.circular(isTablet ? 24.r : 20.r),
                border: Border.all(
                  color: const Color(0xFF4F5599).withOpacity(0.3),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon sukses
                  Container(
                    padding: EdgeInsets.all(
                      _getResponsiveSpacing(context, 16).w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: isSmallScreen ? 40.sp : (isTablet ? 56.sp : 48.sp),
                    ),
                  ),
                  SizedBox(height: _getResponsiveSpacing(context, 16).h),

                  // Judul sukses
                  Text(
                    "Booking Berhasil!",
                    style: GoogleFonts.poppins(
                      fontSize: _getResponsiveFontSize(
                        context,
                        isSmallScreen ? 18 : 20,
                      ).sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: _getResponsiveSpacing(context, 8).h),
                  Text(
                    "Mobil siap digunakan sesuai jadwal",
                    style: GoogleFonts.poppins(
                      fontSize: _getResponsiveFontSize(
                        context,
                        isSmallScreen ? 12 : 14,
                      ).sp,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: _getResponsiveSpacing(context, 24).h),

                  // Info mobil
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      _getResponsiveSpacing(context, 16).w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF252535),
                      borderRadius: BorderRadius.circular(
                        isTablet ? 20.r : 16.r,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          brand.toUpperCase(),
                          style: GoogleFonts.poppins(
                            fontSize: _getResponsiveFontSize(
                              context,
                              isSmallScreen ? 10 : 12,
                            ).sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: _getResponsiveSpacing(context, 4).h),
                        Text(
                          carName,
                          style: GoogleFonts.poppins(
                            fontSize: _getResponsiveFontSize(
                              context,
                              isSmallScreen ? 16 : 18,
                            ).sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _getResponsiveSpacing(context, 20).h),

                  // Detail booking
                  _buildInfoRow(
                    context: context,
                    icon: Icons.calendar_today_outlined,
                    label: "Periode Sewa",
                    value:
                        "${_formatDate(startDate)} – ${_formatDate(endDate)}",
                  ),
                  SizedBox(height: _getResponsiveSpacing(context, 12).h),
                  _buildInfoRow(
                    context: context,
                    icon: Icons.access_time_outlined,
                    label: "Durasi",
                    value: "${_calculateDays()} hari",
                  ),
                  SizedBox(height: _getResponsiveSpacing(context, 12).h),
                  _buildInfoRow(
                    context: context,
                    icon: Icons.payment_outlined,
                    label: "Metode Bayar",
                    value: paymentMethod,
                  ),
                  SizedBox(height: _getResponsiveSpacing(context, 24).h),

                  // Total
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: _getResponsiveSpacing(context, 16).h,
                      horizontal: _getResponsiveSpacing(context, 16).w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F5599).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        isTablet ? 16.r : 12.r,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Total Pembayaran",
                            style: GoogleFonts.poppins(
                              fontSize: _getResponsiveFontSize(
                                context,
                                isSmallScreen ? 14 : 16,
                              ).sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            formattedTotal,
                            style: GoogleFonts.poppins(
                              fontSize: _getResponsiveFontSize(
                                context,
                                isSmallScreen ? 16 : 18,
                              ).sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF4F5599),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    final isSmallScreen = MediaQuery.of(context).size.width < 375;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(_getResponsiveSpacing(context, 8).w),
          decoration: BoxDecoration(
            color: const Color(0xFF4F5599).withOpacity(0.15),
            borderRadius: BorderRadius.circular(
              _getResponsiveSpacing(context, 8).r,
            ),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4F5599),
            size: _getResponsiveFontSize(context, isSmallScreen ? 18 : 20).sp,
          ),
        ),
        SizedBox(width: _getResponsiveSpacing(context, 12).w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: _getResponsiveFontSize(
                    context,
                    isSmallScreen ? 11 : 13,
                  ).sp,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: _getResponsiveFontSize(
                    context,
                    isSmallScreen ? 13 : 15,
                  ).sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
