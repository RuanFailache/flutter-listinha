import 'package:listinha/features/home/domain/domain.dart';

abstract class ProductRepository {
  Future<List<ProductDto>> findAll();
}
