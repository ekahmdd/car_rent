import 'package:car_rent/screens/booking_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookingDetailPage extends StatefulWidget {
  final String carName;
  final String brand;
  final String imagePath;
  final String price;

  const BookingDetailPage({
    super.key,
    required this.carName,
    required this.brand,
    required this.imagePath,
    required this.price,
  });

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  DateTime? startDate;
  DateTime? endDate;
  String? paymentMethod;

  final List<Map<String, dynamic>> paymentOptions = [
    {"name": "BRI Virtual Account", "icon": Icons.account_balance},
    {"name": "BCA Virtual Account", "icon": Icons.account_balance},
    {"name": "Mandiri Virtual Account", "icon": Icons.account_balance},
    {"name": "Gopay", "icon": Icons.wallet},
    {"name": "OVO", "icon": Icons.wallet},
    {"name": "ShopeePay", "icon": Icons.wallet},
  ];

  Future<void> _pickDate({required bool isStart}) async {
    final DateTime now = DateTime.now();
    final DateTime lastSelectableDate = DateTime(2030, 12, 31);

    DateTime initialDate;
    DateTime firstDate;

    if (isStart) {
      initialDate = startDate ?? now;
      firstDate = now;
    } else {
      // Cannot pick end date without a start date
      if (startDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Pilih tanggal mulai terlebih dahulu",
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        );
        return;
      }
      initialDate = endDate ?? startDate!;
      firstDate = startDate!;
    }

    // Ensure dates are within valid bounds
    if (initialDate.isBefore(firstDate)) initialDate = firstDate;
    if (initialDate.isAfter(lastSelectableDate))
      initialDate = lastSelectableDate;
    if (firstDate.isAfter(lastSelectableDate)) firstDate = lastSelectableDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastSelectableDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF4F5599),
              onPrimary: Colors.white,
              surface: Color(0xFF1A1A24),
              onSurface: Colors.white,
            ),
            dialogTheme: const DialogThemeData(backgroundColor: Color(0xFF1A1A24)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
          // Reset end date if it's no longer valid
          if (endDate != null && endDate!.isBefore(startDate!)) {
            endDate = null;
          }
        } else {
          endDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Pilih tanggal";
    return DateFormat("dd MMMM yyyy", "id_ID").format(date);
  }

  int _calculateDays() {
    if (startDate == null || endDate == null) return 0;
    return endDate!.difference(startDate!).inDays + 1; // inclusive
  }

  String _calculateTotal() {
    if (startDate == null || endDate == null) return "0";
    int days = _calculateDays();
    // Remove dots from price string (e.g., "150.000" → 150000)
    int pricePerDay = int.parse(widget.price.replaceAll(RegExp(r'\.'), ''));
    int total = days * pricePerDay;
    return NumberFormat("#,###", "id_ID").format(total).replaceAll(",", ".");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B11),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        title: Text(
          "Detail Booking",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isTablet ? 20.sp : 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 32.w : 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Info Card
            Container(
              padding: EdgeInsets.all(isTablet ? 20.w : 16.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF484263), Color(0xFF4F5599)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4F5599).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: isTablet ? 100.w : 80.w,
                    height: isTablet ? 100.w : 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.brand.toUpperCase(),
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 13.sp : 11.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.carName,
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20.sp : 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: Colors.white70,
                              size: isTablet ? 18.sp : 16.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Rp ${widget.price} / hari",
                              style: GoogleFonts.poppins(
                                fontSize: isTablet ? 15.sp : 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            // Rental Period Section
            Text(
              "Periode Sewa",
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 18.sp : 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),

            _buildDateField(
              label: "Tanggal Mulai",
              date: startDate,
              icon: Icons.event_available,
              onTap: () => _pickDate(isStart: true),
              isTablet: isTablet,
            ),

            SizedBox(height: 16.h),

            _buildDateField(
              label: "Tanggal Selesai",
              date: endDate,
              icon: Icons.event_busy,
              onTap: () => _pickDate(isStart: false),
              isTablet: isTablet,
            ),

            // Duration Display
            if (startDate != null && endDate != null) ...[
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A24),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xFF4F5599).withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: const Color(0xFF4F5599),
                      size: isTablet ? 22.sp : 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "Durasi: ${_calculateDays()} hari",
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 15.sp : 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            SizedBox(height: 30.h),

            // Payment Method Section
            Text(
              "Metode Pembayaran",
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 18.sp : 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),

            ...paymentOptions.map((option) {
              bool isSelected = paymentMethod == option["name"];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      paymentMethod = option["name"];
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.all(isTablet ? 18.w : 16.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF4F5599).withOpacity(0.2)
                          : const Color(0xFF1A1A24),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF4F5599)
                            : Colors.white.withOpacity(0.1),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF4F5599)
                                : Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(
                            option["icon"] as IconData,
                            color: Colors.white,
                            size: isTablet ? 24.sp : 22.sp,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Text(
                            option["name"] as String,
                            style: GoogleFonts.poppins(
                              fontSize: isTablet ? 15.sp : 14.sp,
                              color: Colors.white,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check_circle,
                            color: const Color(0xFF4F5599),
                            size: isTablet ? 24.sp : 22.sp,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),

            SizedBox(height: 30.h),

            // Cost Summary
            if (startDate != null && endDate != null) ...[
              Container(
                padding: EdgeInsets.all(isTablet ? 20.w : 16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A24),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF4F5599).withOpacity(0.3),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Harga per hari",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 15.sp : 14.sp,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "Rp ${widget.price}",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 15.sp : 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Durasi",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 15.sp : 14.sp,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "${_calculateDays()} hari",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 15.sp : 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.white.withOpacity(0.2), height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 18.sp : 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp ${_calculateTotal()}",
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20.sp : 18.sp,
                            color: const Color(0xFF4F5599),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: isTablet ? 60.h : 55.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF484263), Color(0xFF4F5599)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
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
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                if (startDate != null &&
                    endDate != null &&
                    paymentMethod != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingSuccessPage(
                        startDate: startDate!,
                        endDate: endDate!,
                        paymentMethod: paymentMethod!,
                        carName: widget.carName,
                        brand: widget.brand,
                        imagePath: widget.imagePath,
                        price: widget.price,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Harap lengkapi semua data",
                        style: GoogleFonts.poppins(),
                      ),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Konfirmasi Booking",
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 18.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: isTablet ? 24.sp : 22.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime? date,
    required IconData icon,
    required VoidCallback onTap,
    required bool isTablet,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 14.sp : 13.sp,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A24),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: date != null
                    ? const Color(0xFF4F5599)
                    : Colors.white.withOpacity(0.1),
                width: date != null ? 1.5 : 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: date != null
                          ? const Color(0xFF4F5599)
                          : Colors.white54,
                      size: isTablet ? 22.sp : 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      _formatDate(date),
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 15.sp : 14.sp,
                        color: date != null ? Colors.white : Colors.white54,
                        fontWeight: date != null
                            ? FontWeight.w500
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white54,
                  size: isTablet ? 18.sp : 16.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
