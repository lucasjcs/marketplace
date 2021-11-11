import '../../core/domain/product.dart';

class ProductModel extends Product {
  final String? id;
  final String? name;
  final String? description;
  final String? image;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
  }) : super(
          id: id,
          name: name,
          description: description,
          image: image,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}
