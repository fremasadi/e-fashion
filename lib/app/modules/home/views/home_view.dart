import 'package:fashion_ecommerce/app/modules/home/views/sale_view.dart';
import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/cards/ProductCard.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/img_home.png'),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fashion\nsale',
                          style: TextStyle(
                              fontSize: 48.sp,
                              color: AppColor.white,
                              fontFamily: 'Metro-Bold'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 26,
                            bottom: 40,
                          ),
                          child: Container(
                            width: 160.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColor.primary,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.to(const SaleView());
                              },
                              child: Text(
                                'Check',
                                style: TextStyle(
                                  fontFamily: 'Metro-Regular',
                                  fontSize: 14,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 33.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0, bottom: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New',
                              style: TextStyle(
                                  fontSize: 34.sp, fontFamily: 'Metro-Bold'),
                            ),
                            Text(
                              'You’ve never seen it before!',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColor.grey,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 350.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8.0),
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            var product = controller.products[index];
                            return ProductCard(
                              productName: product.name,
                              productType: product.type,
                              productImage: product.image,
                              productStatusSale: product.isOnSale,
                              originalPrice: product.price,
                              discountedPrice: product.discountedPrice,
                              rating: product.rating,
                              reviewCount: product.reviewCount,
                            );
                          },
                        ),
                      );
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
