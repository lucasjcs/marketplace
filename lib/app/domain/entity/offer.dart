import '../../domain/model/model.dart';

class Offer {
  final String id;
  final int price;
  final ProductModel product;

  Offer({
    required this.id,
    required this.price,
    required this.product,
  });
}
