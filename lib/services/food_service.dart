import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodService {
  static const String _baseUrl = 'https://world.openfoodfacts.org/api/v0/product/';

  Future<Map<String, dynamic>?> fetchProduct(String barcode) async {
    final response = await http.get(Uri.parse('$_baseUrl$barcode.json'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}