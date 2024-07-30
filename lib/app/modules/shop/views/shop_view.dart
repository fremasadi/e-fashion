import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/cards/HorizontalProdukCard.dart';
import '../../../widgets/cards/RoundedCard.dart';
import '../../../widgets/cards/VerticalProductCard.dart';
import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 58.0, left: 11, right: 11, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style:
                      TextStyle(fontSize: 18.sp, fontFamily: 'Metro-SemiBold'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 32.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RoundedCard(title: 'T-shirts', onPressed: () {}),
                  RoundedCard(title: 'Crop tops', onPressed: () {}),
                  RoundedCard(title: 'Sleeveless', onPressed: () {}),
                  RoundedCard(title: 'Shirts', onPressed: () {}),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/ic_filter.png',
                        width: 24.w, height: 24.h),
                    SizedBox(width: 7.w),
                    Text(
                      'Filters',
                      style: TextStyle(fontSize: 11.sp, color: AppColor.black2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/ic_filter_price.png',
                        width: 24.w, height: 24.h),
                    SizedBox(width: 7.w),
                    Text(
                      'Price: lowest to high',
                      style: TextStyle(fontSize: 11.sp, color: AppColor.black2),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.isHorizontalView.value =
                        !controller.isHorizontalView.value;
                  },
                  icon: Icon(Icons.grid_view_sharp, color: AppColor.black2),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                var products = controller.products;
                return controller.isHorizontalView.value
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 8.0.w,
                          mainAxisSpacing: 20.0.h,
                          childAspectRatio: 3.0,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_PRODUK,
                                  arguments: product);
                            },
                            child: HorizontalProductCard(
                              productName: product.name,
                              productType: product.type,
                              productImage: product.image,
                              productStatusSale: product.isOnSale,
                              originalPrice: product.originalPrice,
                              discountedPrice: product.discountedPrice,
                              rating: product.rating,
                              reviewCount: product.reviewCount,
                            ),
                          );
                        },
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0.w,
                          mainAxisSpacing: 20.0.h,
                          childAspectRatio:
                              0.65, // Aspect ratio for vertical card
                        ),
                        padding: const EdgeInsets.all(8.0),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_PRODUK,
                                  arguments: product);
                            },
                            child: VerticalProductCard(
                              productName: product.name,
                              productType: product.type,
                              productImage: product.image,
                              productStatusSale: product.isOnSale,
                              originalPrice: product.originalPrice,
                              discountedPrice: product.discountedPrice,
                              rating: product.rating,
                              reviewCount: product.reviewCount,
                            ),
                          );
                        },
                      );
              }
            }),
          )
        ],
      ),
    );
  }
}
