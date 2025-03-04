import 'package:ostad_flutter/core/constants/Environment.dart';

class Apis {
  // CRUD Product APIs
  static String productBaseUrl = Environment.crudApiBaseUrl;
  static String createProduct() => '$productBaseUrl/CreateProduct';
  static String readProduct() => '$productBaseUrl/ReadProduct';
  static String updateProduct(String id) => '$productBaseUrl/UpdateProduct/$id';
  static String readProductById(String id) => '$productBaseUrl/ReadProductById/$id';
  static String deleteProduct(String id) => '$productBaseUrl/DeleteProduct/$id';
}