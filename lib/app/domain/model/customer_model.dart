import '../../domain/entity/entity.dart';

import 'model.dart';

class CustomerModel extends Customer {
  final String? id;
  final String? name;
  final List<OfferModel>? offers;
  int? balance;

  CustomerModel({
    this.id,
    this.name,
    this.balance,
    this.offers,
  }) : super(
          id: id,
          name: name,
          offers: offers,
          balance: balance,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      balance: json['balance'],
      offers: json['offers'] != null
          ? (json['offers'] as List)
              .map((it) => OfferModel.fromJson(it))
              .toList()
          : null,
    );
  }
}
