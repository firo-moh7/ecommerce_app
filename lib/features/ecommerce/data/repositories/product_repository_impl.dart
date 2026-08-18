import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource dataSource;

  const ProductRepositoryImpl(this.dataSource);

  @override
  Future<void> insertProduct(Product product) {
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );

    return dataSource.insertProduct(productModel);
  }

  @override
  Future<Product> getProduct(String id) {
    return dataSource.getProduct(id);
  }

  @override
  Future<void> updateProduct(Product product) {
    final productModel = ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );

    return dataSource.updateProduct(productModel);
  }

  @override
  Future<void> deleteProduct(String id) {
    return dataSource.deleteProduct(id);
  }
}