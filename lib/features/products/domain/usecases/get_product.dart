import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProduct {
  final ProductRepository repository;

  const GetProduct(this.repository);

  Future<Product> call(String id) {
    return repository.getProduct(id);
  }
}