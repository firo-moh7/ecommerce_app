import 'package:ecommerce_app/features/ecommerce/domain/entities/product.dart';
import 'package:ecommerce_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/ecommerce/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeProductRepository implements ProductRepository {
  String? deletedProductId;

  @override
  Future<void> deleteProduct(String id) async {
    deletedProductId = id;
  }

  @override
  Future<void> insertProduct(Product product) {
    throw UnimplementedError();
  }

  @override
  Future<Product> getProduct(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(Product product) {
    throw UnimplementedError();
  }
}

void main() {
  test('should delete a product through the repository', () async {
    final repository = FakeProductRepository();
    final deleteProduct = DeleteProduct(repository);

    await deleteProduct('p001');

    expect(repository.deletedProductId, 'p001');
  });
}