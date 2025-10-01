import 'package:car_rent/models/booking.dart';



class BookingRepository {
  static final List<BookingHistory> _histories = [];

  static List<BookingHistory> get histories => _histories;

  static void addHistory(BookingHistory history) {
    _histories.add(history);
  }
}
