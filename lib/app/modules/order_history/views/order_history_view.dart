import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:fashion_ecommerce/app/widgets/cards/RoundedCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/order_history_controller.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 52),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 28.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 28.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 34.sp,
                  fontFamily: 'Metro-Bold',
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order №1947034',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Metro-SemiBold',
                          ),
                        ),
                        Text(
                          '05-12-2019',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.grey,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Text(
                            'Tracking number:  ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.grey,
                            ),
                          ),
                          Text(
                            'IW3475453455',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Metro-Medium',
                              color: AppColor.black2,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Quantity:  ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.grey,
                            ),
                            children: [
                              TextSpan(
                                text: '3',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Metro-SemiBold',
                                    color: AppColor.black2),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Total Amount:  ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.grey,
                            ),
                            children: [
                              TextSpan(
                                text: '112\$',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Metro-SemiBold',
                                    color: AppColor.black2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedCard(
                            title: 'Details',
                            onPressed: () {},
                          ),
                          Text(
                            'Delivered',
                            style: TextStyle(
                              fontFamily: 'Metro-Medium',
                              fontSize: 14.sp,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
