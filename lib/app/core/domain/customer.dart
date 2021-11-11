import 'domain.dart';

class Customer {
  String? id;
  String? name;
  List<Offer>? offers;
  int? balance;

  Customer({
    this.id,
    this.name,
    this.balance,
    this.offers,
  });
}
