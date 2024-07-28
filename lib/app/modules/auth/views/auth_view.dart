import 'package:fashion_ecommerce/app/modules/auth/views/login_view.dart';
import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:fashion_ecommerce/app/widgets/cards/BottomButtonCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/cards/TextFieldCard.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 106.0, left: 14, bottom: 73),
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 34.sp, fontFamily: 'Metro-Bold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFieldCard(
                title: 'Name',
                controller: controller.controllerName,
                titleStyle: TextStyle(fontSize: 14.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFieldCard(
                title: 'Email',
                controller: controller.controllerEmail,
                titleStyle: TextStyle(fontSize: 14.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFieldCard(
                title: 'Password',
                controller: controller.controllerPassword,
                titleStyle: TextStyle(fontSize: 14.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 28, right: 48),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.LOGIN);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Metro-Medium',
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColor.primary,
                          size: 24.sp,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: BottomButtonCard(
                onPressed: () {},
                title: 'Sign Up',
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Metro-Medium',
                  color: AppColor.white,
                ),
                heightContainer: 48.h,
                backgroundColor: AppColor.primary,
                borderColor: null,
                radiusBorder: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
