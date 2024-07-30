import 'dart:convert';
import 'dart:ffi';
import 'package:fashion_ecommerce/core/helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/entities/OrderDetail.dart';
import '../../../data/entities/products.dart';
import '../../auth/controllers/login_controller.dart';

class BagController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  var orderDetails = <OrderDetail>[].obs;

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
    final userId = loginController.userId.value;

    final response = await http.get(Uri.parse('$baseUrl/order_details'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<OrderDetail> orderDetails = data
          .map((json) => OrderDetail.fromJson(json))
          .where((orderDetail) => orderDetail.userId == int.parse(userId))
          .toList();

      return orderDetails;
    } else {
      throw Exception('Failed to load order details');
    }
  }

  void increaseQuantity(OrderDetail orderDetail) {
    orderDetail.quantity++;
    updateOrderDetail(orderDetail);
  }

  void decreaseQuantity(OrderDetail orderDetail) {
    if (orderDetail.quantity > 1) {
      orderDetail.quantity--;
      updateOrderDetail(orderDetail);
    }
  }

  Future<void> updateOrderDetail(OrderDetail orderDetail) async {
    final response = await http.put(
      Uri.parse('$baseUrl/order_details/${orderDetail.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(orderDetail.toJson()),
    );

    if (response.statusCode == 204) {
      await fetchOrderDetails();
    } else if (response.statusCode == 400) {
      Get.snackbar('Error', 'Invalid request data.');
    } else if (response.statusCode == 401) {
      Get.snackbar('Error', 'Unauthorized access.');
    } else if (response.statusCode == 500) {
      Get.snackbar('Error', 'Server error.');
    } else {
      Get.snackbar('Error', 'Failed to update order detail.');
    }
  }

  double getTotalAmount(
      List<OrderDetail> orderDetails, List<Product> products) {
    double total = 0.0;
    for (var orderDetail in orderDetails) {
      Product product =
          products.firstWhere((p) => p.id == orderDetail.productId);
      total += product.originalPrice * orderDetail.quantity;
    }
    return total;
  }
}
