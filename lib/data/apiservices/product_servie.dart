import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tigabitsmt/core/endpoints/endpoints_url.dart';
import 'package:tigabitsmt/data/models/product_model.dart';

class ProductService {

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(Endpoints.apiUrl));
print(response.statusCode);
print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
