import '../../core/domain/product.dart';

class ProductModel extends Product {
  String? id;
  String? name;
  String? description;
  String? image;

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
