import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:fashion_ecommerce/app/widgets/cards/HorizontalCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 108.0, bottom: 24),
                child: Text(
                  'My profile',
                  style: TextStyle(fontSize: 34.sp, fontFamily: 'Metro-Bold'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Row(
                  children: [
                    Container(
                      width: 64.0.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/img_profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fremas Adi',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Metro-SemiBold',
                            ),
                          ),
                          Text(
                            'fremas@gmail.com',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Metro-Medium',
                              color: AppColor.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              HorizontalCard(
                title: 'My Orders',
                subtitle: 'Already have 12 orders',
                onPressed: () {
                  Get.toNamed(Routes.ORDER_HISTORY);
                },
                width: context.width,
                icon: Icons.arrow_forward_ios,
                borderColor: null,
              ),
              HorizontalCard(
                title: 'Shipping addresses',
                subtitle: '3 ddresses',
                onPressed: () {},
                width: context.width,
                icon: Icons.arrow_forward_ios,
                borderColor: null,
              ),
              HorizontalCard(
                title: 'Payment methods',
                subtitle: 'Visa  **34',
                onPressed: () {},
                width: context.width,
                icon: Icons.arrow_forward_ios,
                borderColor: null,
              ),
              HorizontalCard(
                title: 'Promocodes',
                subtitle: 'You have special promocodes',
                onPressed: () {},
                width: context.width,
                icon: Icons.arrow_forward_ios,
                borderColor: null,
              ),
              HorizontalCard(
                title: 'My reviews',
                subtitle: 'Reviews for 4 items',
                onPressed: () {},
                width: context.width,
                icon: Icons.arrow_forward_ios,
                borderColor: null,
              ),
              HorizontalCard(
                title: 'Settting',
                subtitle: 'Notification,password',
                onPressed: () {},
                width: context.width,
                icon: Icons.arrow_forward_ios,
                borderColor: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
