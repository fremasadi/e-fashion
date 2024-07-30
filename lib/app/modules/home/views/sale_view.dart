import 'package:fashion_ecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/cards/VerticalProductCard.dart';

class SaleView extends GetView<HomeController> {
  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/img_sale.png'),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 26.0, left: 16.0),
                    child: Text(
                      'Street clothes',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontFamily: 'Metro-Bold',
                        color: AppColor.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38, left: 16),
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
                              'Sale',
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
                ],
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                var filteredProducts = controller.products
                    .where((product) => product.isOnSale)
                    .toList();
                return SizedBox(
                  height: 350.h,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20.0.h,
                      childAspectRatio: 2,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      var product = filteredProducts[index];
                      return VerticalProductCard(
                        productName: product.name,
                        productType: product.type,
                        productImage: product.image,
                        productStatusSale: product.isOnSale,
                        originalPrice: product.originalPrice,
                        discountedPrice: product.discountedPrice,
                        rating: product.rating,
                        reviewCount: product.reviewCount,
                      );
                    },
                  ),
                );
              }
            }),
            Padding(
              padding: EdgeInsets.only(left: 14.0, top: 0.0),
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
                      var filteredProducts = controller.products
                          .where((product) => !product.isOnSale)
                          .toList();
                      return SizedBox(
                        height: 350.h,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 20.0.h,
                            childAspectRatio: 2, // Rasio aspek anak grid
                          ),
                          padding: const EdgeInsets.all(8.0),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            var product = filteredProducts[index];
                            return VerticalProductCard(
                              productName: product.name,
                              productType: product.type,
                              productImage: product.image,
                              productStatusSale: product.isOnSale,
                              originalPrice: product.originalPrice,
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
