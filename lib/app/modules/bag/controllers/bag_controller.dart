import 'dart:convert';

import 'package:fashion_ecommerce/core/helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/entities/OrderDetail.dart';
import '../../../data/entities/products.dart';

class BagController extends GetxController {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<OrderDetail>> fetchOrderDetails() async {
    final response = await http.get(Uri.parse('$baseUrl/order_details'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => OrderDetail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load order details');
    }
  }
}
