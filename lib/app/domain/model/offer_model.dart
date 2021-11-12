import '../../domain/entity/entity.dart';

import 'model.dart';

class OfferModel extends Offer {
  final String? id;
  final int? price;
  final ProductModel? product;

  OfferModel({
    this.id,
    this.price,
    this.product,
  }) : super(
          id: id,
          price: price,
          product: product,
        );

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      price: json['price'],
      product: ProductModel.fromJson(
        json['product'],
      ),
    );
  }
}
