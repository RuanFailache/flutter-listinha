import 'package:equatable/equatable.dart';
import 'package:listinha/core/data/models/product_model.dart';

class ProductDto extends Equatable {
  final String id;
  final String name;
  final double price;
  final DateTime createdAt;
  final bool isAddedToCart;

  const ProductDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isAddedToCart,
    required this.createdAt,
  });

  static ProductDto fromModel(ProductModel model) {
    return ProductDto(
      id: model.id,
      name: model.name,
      price: model.price,
      createdAt: model.createdAt,
      isAddedToCart: model.isAddedToCart,
    );
  }

  @override
  List<String> get props => [id];
}
