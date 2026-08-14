import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_product.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeProductRepository implements ProductRepository {
  final Product product;

  FakeProductRepository(this.product);

  String? requestedId;

  @override
  Future<Product> getProduct(String id) async {
    requestedId = id;
    return product;
  }

  @override
  Future<void> insertProduct(Product product) {
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
  test('should get a product from the repository', () async {
    const product = Product(
      id: 'p001',
      name: 'Laptop',
      description: 'Developer laptop',
      price: 85000,
      imageUrl: 'laptop.jpg',
    );

    final repository = FakeProductRepository(product);
    final getProduct = GetProduct(repository);

    final result = await getProduct('p001');

    expect(result, product);
    expect(repository.requestedId, 'p001');
  });
}