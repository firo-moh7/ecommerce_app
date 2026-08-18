import 'package:ecommerce_app/features/ecommerce/data/datasources/product_remote_datasource.dart';
import 'package:ecommerce_app/features/ecommerce/data/models/product_model.dart';
import 'package:ecommerce_app/features/ecommerce/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeProductRemoteDataSource implements ProductRemoteDataSource {
  ProductModel? insertedProduct;
  ProductModel? updatedProduct;
  String? requestedId;
  String? deletedProductId;

  final ProductModel product;

  FakeProductRemoteDataSource(this.product);

  @override
  Future<void> insertProduct(ProductModel product) async {
    insertedProduct = product;
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    requestedId = id;
    return product;
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    updatedProduct = product;
  }

  @override
  Future<void> deleteProduct(String id) async {
    deletedProductId = id;
  }
}

void main() {
  const product = Product(
    id: 'p001',
    name: 'Laptop',
    description: 'Developer laptop',
    price: 85000,
    imageUrl: 'laptop.jpg',
  );

  const productModel = ProductModel(
    id: 'p001',
    name: 'Laptop',
    description: 'Developer laptop',
    price: 85000,
    imageUrl: 'laptop.jpg',
  );

  group('ProductRepositoryImpl', () {
    test('should convert Product to ProductModel and insert it', () async {
      final dataSource = FakeProductRemoteDataSource(productModel);
      final repository = ProductRepositoryImpl(dataSource);

      await repository.insertProduct(product);

      expect(dataSource.insertedProduct, productModel);
    });

    test('should get a product from the data source', () async {
      final dataSource = FakeProductRemoteDataSource(productModel);
      final repository = ProductRepositoryImpl(dataSource);

      final result = await repository.getProduct('p001');

      expect(result, productModel);
      expect(dataSource.requestedId, 'p001');
    });

    test('should convert Product to ProductModel and update it', () async {
      final dataSource = FakeProductRemoteDataSource(productModel);
      final repository = ProductRepositoryImpl(dataSource);

      await repository.updateProduct(product);

      expect(dataSource.updatedProduct, productModel);
    });

    test('should delete a product using its id', () async {
      final dataSource = FakeProductRemoteDataSource(productModel);
      final repository = ProductRepositoryImpl(dataSource);

      await repository.deleteProduct('p001');

      expect(dataSource.deletedProductId, 'p001');
    });
  });
}