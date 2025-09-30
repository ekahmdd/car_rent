class Booking {
  final String carName;
  final String carBrand;
  final String carImage;
  final DateTime startDate;
  final DateTime endDate;
  final String paymentMethod;
  final int totalPrice;

  Booking({
    required this.carName,
    required this.carBrand,
    required this.carImage,
    required this.startDate,
    required this.endDate,
    required this.paymentMethod,
    required this.totalPrice,
  });
}
