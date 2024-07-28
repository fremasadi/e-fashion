import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../core/helper.dart';

class AuthController extends GetxController {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final isFilledEmail = false.obs;
  final isFilledPassword = false.obs;

  Future<void> signUp() async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': controllerName.text,
        'email': controllerEmail.text,
        'password': controllerPassword.text,
      }),
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'User registered successfully');
      Get.toNamed('/login'); // Navigate to login
    } else {
      Get.snackbar('Error', 'Failed to register user');
    }
  }
}
