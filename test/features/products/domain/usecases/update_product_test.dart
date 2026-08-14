import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
class FakeProductRepository implements ProductRepository {
  Product? updatedProduct;

  @override
  Future<void> updateProduct(Product product) async {
    updatedProduct = product;
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
  Future<void> deleteProduct(String id) {
    throw UnimplementedError();
  }
}

void main() {
  test('should update a product through the repository', () async {
    final repository = FakeProductRepository();
    final updateProduct = UpdateProduct(repository);

    const product = Product(
      id: 'p001',
      name: 'Updated Laptop',
      description: 'Updated developer laptop',
      price: 90000,
      imageUrl: 'updated_laptop.jpg',
    );

    await updateProduct(product);

    expect(repository.updatedProduct, product);
  });
}