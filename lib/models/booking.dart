class BookingHistory {
  final String carName;
  final String brand;
  final String imagePath;
  final DateTime startDate;
  final DateTime endDate;
  final String paymentMethod;

  BookingHistory({
    required this.carName,
    required this.brand,
    required this.imagePath,
    required this.startDate,
    required this.endDate,
    required this.paymentMethod,
  });

  int get totalDays => endDate.difference(startDate).inDays;
}
