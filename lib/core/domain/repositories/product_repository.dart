import '../dto/dto.dart';

abstract class ProductRepository {
  Future<List<ProductDto>> findAll();
}
