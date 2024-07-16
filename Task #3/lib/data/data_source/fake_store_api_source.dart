import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_model/fake_store_api_model.dart';

class FakeStoreApiClient {
  static bool isLoading = true;
  static List<ProductDataModel> products = [];
  static bool errorOccurred = false;
  static String errorMessage = '';

  static Future<bool> getProductsData() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      try {
        List<dynamic> data = jsonDecode(response.body);

        for (var item in data) {
          ProductDataModel p = ProductDataModel.fromMapJson(item);

          products.add(p);
        }

        isLoading = false;
        return true;
      } catch (e) {
        isLoading = false;
        errorOccurred = true;
        errorMessage = e.toString();
        return false;
      }
    } else {
      isLoading = false;
      errorOccurred = true;
      errorMessage = '${response.statusCode}\n${response.body}';
      return false;
    }
  }
}