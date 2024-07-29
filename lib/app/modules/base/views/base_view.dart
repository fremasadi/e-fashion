import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../bag/views/bag_view.dart';
import '../../favorite/views/favorite_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../shop/views/shop_view.dart';
import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseController controller = Get.put(BaseController());
    final List<Widget> widgetOptions = <Widget>[
      const HomeView(),
      const ShopView(),
      const BagView(),
      const FavoriteView(),
      const ProfileView(),
    ];

    return Scaffold(
      appBar: null,
      body: Obx(() => widgetOptions.elementAt(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_home.png'),
                  size: 30.sp,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_shop.png'),
                  size: 30.sp,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_bag.png'),
                  size: 30.sp,
                ),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_favorite.png'),
                  size: 30.sp,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  const AssetImage('assets/icons/ic_profile.png'),
                  size: 30.sp,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.grey,
            selectedLabelStyle: const TextStyle(fontFamily: 'Metro-SemiBold'),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Metro-Regular'),
            onTap: controller.onItemTapped,
          )),
    );
  }
}
