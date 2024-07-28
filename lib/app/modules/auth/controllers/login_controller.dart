import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/entities/users.dart';
import '../../../data/repository/user_repository.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final UserRepository userRepository = UserRepository();

  var isFilledEmail = false.obs;
  var isFilledPassword = false.obs;

  @override
  void onInit() {
    super.onInit();

    emailFocusNode.addListener(() {
      update();
    });

    passwordFocusNode.addListener(() {
      update();
    });

    controllerEmail.addListener(() {
      isFilledEmail.value = controllerEmail.text.isNotEmpty;
    });

    controllerPassword.addListener(() {
      isFilledPassword.value = controllerPassword.text.isNotEmpty;
    });
  }

  @override
  void onClose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      List<User> users = await userRepository.fetchUsers();
      String email = controllerEmail.text;
      String password = controllerPassword.text;

      User? user = users.firstWhereOrNull(
        (user) => user.email == email && user.password == password,
      );

      if (user != null) {
        Get.toNamed(Routes.HOME);
      } else {
        // Handle login failure (e.g., show error message)
        Get.snackbar('Login Failed', 'Invalid email or password');
      }
    } catch (e) {
      // Handle error (e.g., show error message)
      Get.snackbar('Error', e.toString());
    }
  }
}
