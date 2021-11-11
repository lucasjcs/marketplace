import 'domain.dart';

class Offer {
  String? id;
  int? price;
  Product? product;

  Offer({
    required this.id,
    required this.price,
    required this.product,
  });
}
