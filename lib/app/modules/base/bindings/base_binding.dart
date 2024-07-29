import 'package:fashion_ecommerce/app/modules/bag/controllers/bag_controller.dart';
import 'package:fashion_ecommerce/app/modules/shop/controllers/shop_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseController());
    Get.put(HomeController());
    Get.put(ShopController());
    Get.put(BagController());
  }
}
