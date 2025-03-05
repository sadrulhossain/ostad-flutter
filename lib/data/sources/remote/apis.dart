import 'package:ostad_flutter/core/constants/environment.dart';

class Apis {
  // CRUD Product APIs
  static String productBaseUrl = Environment.crudApiBaseUrl;
  static String store() => '$productBaseUrl/CreateProduct';
  static String fetchAll() => '$productBaseUrl/ReadProduct';
  static String update(String id) => '$productBaseUrl/UpdateProduct/$id';
  static String fetch(String id) => '$productBaseUrl/ReadProductById/$id';
  static String delete(String id) => '$productBaseUrl/DeleteProduct/$id';
}