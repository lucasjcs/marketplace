import '../../core/model/model.dart';

class Customer {
  final String? id;
  final String? name;
  final List<OfferModel>? offers;
  final int? balance;

  Customer({
    this.id,
    this.name,
    this.balance,
    this.offers,
  });
}
