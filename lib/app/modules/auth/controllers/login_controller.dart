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

  final userId = ''.obs;

  Future<void> login() async {
    if (controllerEmail.text.isEmpty || controllerPassword.text.isEmpty) {
      Get.snackbar('Error', 'Email and Password cannot be empty');
      return;
    }

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
      final startTime = DateTime.now();

      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: loginData,
      );

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);
      print('Login API call took: ${duration.inMilliseconds}ms');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Response data: $responseData'); // Log response data
        if (responseData.containsKey('id')) {
          // Change userId to id
          userId.value = responseData['id'].toString(); // Store user ID
          Get.snackbar('Success', 'Login successful');
          await Future.delayed(const Duration(seconds: 2));
          Get.offNamed('/base', arguments: responseData);
        } else {
          Get.snackbar('Error', 'Invalid response data: id not found');
        }
      } else {
        final errorData = jsonDecode(response.body);
        Get.snackbar('Error', errorData['message'] ?? 'Failed to login');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to login: $e');
      print('Exception: $e'); // Log exception
    } finally {
      // Dismiss loading dialog
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    }
  }
}
