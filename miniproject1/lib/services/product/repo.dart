import 'dart:convert';

import 'package:http/http.dart';
import 'package:miniproject1/models/product/model.dart';

class Repo {
  String prodsUrl = 'https://fakestoreapi.com/products';

  Future<List<Model>> getProds() async {
    Response response = await get(Uri.parse(prodsUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Model.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
