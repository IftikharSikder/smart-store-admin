import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_store_admin/core/constants/api_endpoints.dart';
import 'package:smart_store_admin/features/product/data/models/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProduct() async {
    final response = await http.get(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.products));
    final decoded = jsonDecode(response.body);
    final data = decoded['data'];
    print(data);
    List<Product> productList = [];
    if (response.statusCode == 200) {
      for (var i in data) {
        productList.add(Product.fromJson(i));
      }
      return productList;
    } else {
      return productList;
    }
  }
}
