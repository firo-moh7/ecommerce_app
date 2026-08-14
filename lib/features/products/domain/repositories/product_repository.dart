import '../entities/product.dart';

abstract class ProductRepository {
  Future<void> insertProduct(Product product);

  Future<Product> getProduct(String id);

  Future<void> updateProduct(Product product);

  Future<void> deleteProduct(String id);
}