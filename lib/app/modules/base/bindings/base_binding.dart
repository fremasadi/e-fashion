import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
      () => BaseController(),
    );
    Get.put(HomeController());
  }
}
