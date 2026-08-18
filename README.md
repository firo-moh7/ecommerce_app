# Ecommerce App

A Flutter eCommerce application built using Clean Architecture and
Test-Driven Development (TDD) principles.

## Features

- Product management
- Create product
- Read product
- Update product
- Delete product
- JSON serialization and deserialization
- Unit testing
- Clean Architecture
- Flutter linting

## Architecture

This project follows Clean Architecture to separate business logic,
data access, and application concerns.

The main structure is:

```text
lib/
└── features/
    └── ecommerce/
        ├── data/
        │   ├── datasources/
        │   │   ├── product_remote_data_source.dart
        │   │   └── product_remote_data_source_impl.dart
        │   │
        │   ├── models/
        │   │   └── product_model.dart
        │   │
        │   └── repositories/
        │       └── product_repository_impl.dart
        │
        └── domain/
            ├── entities/
            │   └── product.dart
            │
            ├── repositories/
            │   └── product_repository.dart
            │
            └── usecases/
                ├── insert_product.dart
                ├── get_product.dart
                ├── update_product.dart
                └── delete_product.dart