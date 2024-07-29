import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/helper.dart';
import '../../../data/entities/products.dart';

class ShopController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var isHorizontalView = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var url = Uri.parse('$baseUrl/products');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        products.value =
            jsonResponse.map((product) => Product.fromJson(product)).toList();
      } else {
        Get.snackbar('Error', 'Gagal menampilkan product');
      }
    } finally {
      isLoading(false);
    }
  }
}
