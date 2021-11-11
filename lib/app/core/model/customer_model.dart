import '../../core/domain/domain.dart';

import 'model.dart';

class CustomerModel extends Customer {
  String? id;
  String? name;
  List<Offer>? offers;
  int? balance;

  CustomerModel({
    this.id,
    this.name,
    this.balance,
    this.offers,
  }) : super(
          id: id,
          name: name,
          balance: balance,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      balance: json['balance'],
      offers: json['offers'].map((it) => OfferModel.fromJson(it)).toList(),
    );
  }
}
