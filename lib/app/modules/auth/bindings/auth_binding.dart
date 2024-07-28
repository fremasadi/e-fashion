import 'package:fashion_ecommerce/app/modules/auth/controllers/login_controller.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.put(LoginController());
  }
}
