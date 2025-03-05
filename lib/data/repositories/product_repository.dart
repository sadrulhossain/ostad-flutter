import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ostad_flutter/data/models/product_model.dart';
import 'package:ostad_flutter/data/sources/remote/apis.dart';

class  ProductRepository {
  List<Data> products = [];

  Future<void> fetchAll() async {
    final response = await http.get(Uri.parse(Apis.fetchAll()));

    if (response.statusCode == 200) {
      ProductModel model = ProductModel.fromJson(jsonDecode(response.body));
      products = model.data ?? [];
    }
  }

  Future<void> store(Map<String, dynamic> product) async {
    final response = await http.post(
      Uri.parse(Apis.store()),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(_formatData(product))
    );

    if (response.statusCode == 201) {
      await fetchAll();
    }
  }

  Future<void> update(String id, Map<String, dynamic> product) async {
    final response = await http.post(
        Uri.parse(Apis.update(id)),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_formatData(product))
    );

    if (response.statusCode == 200) {
      await fetchAll();
    }
  }

  Future<void> delete(String id) async {
    final response = await http.get(Uri.parse(Apis.delete(id)));

    if (response.statusCode == 200) {
      await fetchAll();
    }
  }
  
  dynamic _formatData(Map<String, dynamic> product) {
    Data data = Data(
      name: product['name'],
      code: product['code'],
      img: product['img'],
      qty: product['qty'],
      unitPrice: product['unitPrice'],
      totalPrice: product['totalPrice'],
    );
    return data.toJson();
  }
}