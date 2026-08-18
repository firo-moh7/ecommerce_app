import '../models/product_model.dart';
import 'product_remote_datasource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<ProductModel> _products = [];

  @override
  Future<void> insertProduct(ProductModel product) async {
    _products.add(product);
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    return _products.firstWhere(
      (product) => product.id == id,
    );
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    final index = _products.indexWhere(
      (item) => item.id == product.id,
    );

    if (index == -1) {
      throw Exception('Product not found');
    }

    _products[index] = product;
  }

  @override
  Future<void> deleteProduct(String id) async {
    _products.removeWhere(
      (product) => product.id == id,
    );
  }
}
