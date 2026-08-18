import 'package:ecommerce_app/features/ecommerce/domain/entities/product.dart';
import 'package:ecommerce_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/ecommerce/domain/usecases/insert_product.dart';
import 'package:flutter_test/flutter_test.dart';
class FakeProductRepository implements ProductRepository {
  Product? insertedProduct;

  @override
  Future<void> insertProduct(Product product) async {
    insertedProduct = product;
  }

  @override
  Future<Product> getProduct(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(Product product) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String id) {
    throw UnimplementedError();
  }
}

void main() {
  test('should insert a product through the repository', () async {
    final repository = FakeProductRepository();
    final insertProduct = InsertProduct(repository);

    const product = Product(
      id: 'p001',
      name: 'Laptop',
      description: 'Developer laptop',
      price: 85000,
      imageUrl: 'laptop.jpg',
    );

    await insertProduct(product);

    expect(repository.insertedProduct, product);
  });
}