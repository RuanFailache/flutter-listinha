import 'dart:convert';

class ProductModel {
  final String id;
  final String name;
  final double price;
  final DateTime createdAt;
  final bool isAddedToCart;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.isAddedToCart,
    required this.createdAt,
  });

  static ProductModel fromJson(String json) {
    final mappedProduct = jsonDecode(json);
    return ProductModel(
      id: mappedProduct['id'],
      name: mappedProduct['name'],
      price: mappedProduct['price'],
      createdAt: mappedProduct['createdAt'],
      isAddedToCart: mappedProduct['isAddedToCart'],
    );
  }
}
