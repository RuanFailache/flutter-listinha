import 'package:listinha/core/data/models/product_model.dart';
import 'package:listinha/core/domain/domain.dart';

class RemoteProductRepository implements ProductRepository {
  final _products = <ProductModel>[];

  @override
  findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return _products.map(ProductDto.fromModel).toList();
  }
}
