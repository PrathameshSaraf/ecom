import 'package:dio/dio.dart';

import '../Model/productModel.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<ProductModel>> fetchProducts() async {
    try {
      // Make a GET request to fetch the data
      final response = await _dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<ProductModel> products =
            data.map((json) => ProductModel.fromJson(json)).toList();
        return products;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
