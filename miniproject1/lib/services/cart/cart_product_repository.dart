import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:miniproject1/models/cart/product_cart_model.dart'; // Rename this model if necessary

class CartProductRepository {
  Future<List<ProductCartModel>> getProducts() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      return result.map((e) => ProductCartModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch products");
    }
  }
}
