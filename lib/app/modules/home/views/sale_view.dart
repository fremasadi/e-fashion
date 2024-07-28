import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/cards/ProductCard.dart';

class SaleView extends GetView {
  const SaleView({Key? key}) : super(key: key);
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
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: List.generate(10, (index) {
            //       return ProductCard(
            //         productName: 'Evening Dress',
            //         productType: 'Dorothy Perkins',
            //         productImage: 'assets/images/img_item1.png',
            //         productStatusSale: true,
            //         originalPrice: '15',
            //         discountedPrice: '10',
            //         rating: 4.5,
            //         reviewCount: 10,
            //       );
            //     }),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 14.0, top: 33.0),
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
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: List.generate(10, (index) {
                  //       return ProductCard(
                  //         productName: 'Evening Dress',
                  //         productType: 'Dorothy Perkins',
                  //         productImage: 'assets/images/img_item1.png',
                  //         productStatusSale: false,
                  //         originalPrice: '15',
                  //         discountedPrice: '0',
                  //         rating: 4.5,
                  //         reviewCount: 10,
                  //       );
                  //     }),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
