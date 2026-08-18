import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<void> insertProduct(ProductModel product);

  Future<ProductModel> getProduct(String id);

  Future<void> updateProduct(ProductModel product);

  Future<void> deleteProduct(String id);
}