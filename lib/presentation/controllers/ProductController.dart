import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ostad_flutter/data/sources/Apis.dart';

class  ProductController {
  List products = [];

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Apis.readProduct()));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      products = data['data'];
    }
  }

  Future<void> createProduct(Map? product) async {
    print(product);
    // final response = await http.post(
    //   Uri.parse(Apis.createProduct()),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: {
    //     "ProductName": product?['name'],
    //     "ProductCode": product?['code'],
    //     "Img": product?['img'],
    //     "Qty": product?['qty'],
    //     "UnitPrice": product?['unitPrice'],
    //     "TotalPrice": product?['totalPrice'],
    //   }
    // );
    //
    // if (response.statusCode == 201) {
    //   fetchProducts();
    // }
  }
}