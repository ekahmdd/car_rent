// lib/models/booking.dart
import 'package:flutter/material.dart';

class BookingHistory {
  final String brand;
  final String carName;
  final String price; // format: "150000" (tanpa titik, atau sesuaikan)
  final String imagePath;
  final String description;
  final List<Color> colors;
  final List<String> features;
  final DateTime startDate;
  final DateTime endDate;
  final String paymentMethod;
  final String totalPrice;

  BookingHistory({
    required this.brand,
    required this.carName,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.colors,
    required this.features,
    required this.startDate,
    required this.endDate,
    required this.paymentMethod,
    required this.totalPrice,
  });
}
