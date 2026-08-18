import 'package:ecommerce_app/features/ecommerce/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const productJson = {
    'id': 'p001',
    'name': 'Laptop',
    'description': 'Developer laptop',
    'price': 85000,
    'imageUrl': 'laptop.jpg',
  };

  const productModel = ProductModel(
    id: 'p001',
    name: 'Laptop',
    description: 'Developer laptop',
    price: 85000,
    imageUrl: 'laptop.jpg',
  );

  group('ProductModel', () {
    test('should create a ProductModel from JSON', () {
      final result = ProductModel.fromJson(productJson);

      expect(result.id, 'p001');
      expect(result.name, 'Laptop');
      expect(result.description, 'Developer laptop');
      expect(result.price, 85000);
      expect(result.imageUrl, 'laptop.jpg');
    });

    test('should convert ProductModel to JSON', () {
      final result = productModel.toJson();

      expect(result, productJson);
    });

    test('should convert JSON to ProductModel and back to JSON', () {
      final model = ProductModel.fromJson(productJson);
      final result = model.toJson();

      expect(result, productJson);
    });
  });
}