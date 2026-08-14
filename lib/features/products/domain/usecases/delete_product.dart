import '../repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  const DeleteProduct(this.repository);

  Future<void> call(String id) {
    return repository.deleteProduct(id);
  }
}