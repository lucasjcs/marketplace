import '../../core/domain/domain.dart';

import 'model.dart';

class OfferModel extends Offer {
  String? id;
  int? price;
  Product? product;

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