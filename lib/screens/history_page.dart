// lib/screens/history_page.dart
import 'package:car_rent/models/booking.dart';
import 'package:car_rent/providers/bookingp.dart';
import 'package:car_rent/screens/car_detail_page.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Future<void> _navigateToDetail(BookingHistory item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailCarPage(
          brand: item.brand,
          name: item.carName,
          price: item.price,
          assetPath: item.imagePath,
          description: item.description,
          colors: item.colors,
          features: item.features,
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final histories = BookingRepository.histories;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Riwayat Pesanan",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        
        centerTitle: true,
        foregroundColor: Colors.white,
        
      ),
      
      body: Container(
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0E0E15), Color(0xFF1B1B2F), Color(0xFF2A2A4A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        
        child: histories.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada riwayat",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 80,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  final item = histories[index];
                  final duration = item.endDate
                      .difference(item.startDate)
                      .inDays
                      .clamp(1, 999);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.carName,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "$duration Hari",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.imagePath,
                                width: 100,
                                height: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 100,
                                    height: 70,
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.car_repair,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _navigateToDetail(item),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5A5270),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              "Pesan Lagi",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
