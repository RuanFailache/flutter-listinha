import 'package:equatable/equatable.dart';

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

  @override
  List<String> get props => [id];
}
