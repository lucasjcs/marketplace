import 'package:intl/intl.dart';

class Util {
  static String toMoney(int value) {
    final currency = NumberFormat.currency(symbol: '', locale: 'eu');
    return currency.format(value);
  }
}
