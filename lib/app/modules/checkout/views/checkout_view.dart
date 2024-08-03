import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:fashion_ecommerce/app/widgets/cards/BottomButtonCard.dart';
import 'package:fashion_ecommerce/app/widgets/cards/HorizontalCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final totalAmount = Get.arguments as double;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: 'Metro-SemiBold',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Shipping address',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Metro-SemiBold',
                ),
              ),
            ),
            HorizontalCard(
              title: 'fremas adisa',
              icon: Icons.edit,
              subtitle: 'kediri\n'
                  'jl.mayor bismo, indonesia',
              onPressed: () {},
              width: context.width,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Payment',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Metro-SemiBold',
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: HorizontalCard(
                title: 'cod',
                icon: Icons.payment,
                borderColor: AppColor.grey,
                onPressed: () {},
                width: context.width,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Delivery method',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Metro-SemiBold',
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: HorizontalCard(
                title: 'frego',
                icon: Icons.delivery_dining_sharp,
                borderColor: AppColor.grey,
                onPressed: () {},
                width: context.width,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order:',
                        style: TextStyle(
                          fontFamily: 'Metro-Medium',
                          fontSize: 14.sp,
                          color: AppColor.grey,
                        ),
                      ),
                      Text(
                        '\$${totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Metro-SemiBold',
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery:',
                          style: TextStyle(
                            fontFamily: 'Metro-Medium',
                            fontSize: 14.sp,
                            color: AppColor.grey,
                          ),
                        ),
                        Text(
                          '112\$',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Metro-SemiBold',
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Summary:',
                        style: TextStyle(
                          fontFamily: 'Metro-SemiBold',
                          fontSize: 16.sp,
                          color: AppColor.grey,
                        ),
                      ),
                      Text(
                        '\$${totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Metro-SemiBold',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
              child: BottomButtonCard(
                onPressed: () {},
                title: 'SUBMIT ORDER',
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Metro-SemiBold',
                  color: AppColor.white,
                ),
                heightContainer: 48.h,
                backgroundColor: AppColor.primary,
                borderColor: null,
                radiusBorder: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
