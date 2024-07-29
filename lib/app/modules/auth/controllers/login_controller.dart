import 'dart:convert';
import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../core/helper.dart';
import '../../../widgets/pop_up_load.dart';

class LoginController extends GetxController {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final isFilledEmail = false.obs;
  final isFilledPassword = false.obs;
  final isLoading = false.obs;

  Future<void> login() async {
    Get.dialog(PopUpLoad(children: [
      Column(
        children: [
          CircularProgressIndicator(
            color: AppColor.primary,
            strokeWidth: 4,
          ),
        ],
      )
    ]));

    final loginData = jsonEncode(<String, dynamic>{
      'email': controllerEmail.text,
      'password': controllerPassword.text,
    });

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: loginData,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        Get.snackbar('Success', 'Login successful');
        // Adding a delay before navigating to the next screen
        await Future.delayed(const Duration(seconds: 2));
        Get.toNamed('/base', arguments: responseData);
      } else {
        Get.snackbar('Error', 'Failed to login');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to login: $e');
    } finally {
      // Dismiss loading dialog
      Get.back();
    }
  }
}
