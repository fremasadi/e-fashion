import 'package:fashion_ecommerce/app/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../style/app_color.dart';
import '../../../widgets/cards/BottomButtonCard.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 52.0, left: 14, bottom: 20),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 34.0, left: 14, bottom: 73),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 34.sp, fontFamily: 'Metro-Bold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.emailFocusNode.hasFocus
                            ? Colors.purple
                            : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: TextFormField(
                              controller: controller.controllerEmail,
                              focusNode: controller.emailFocusNode,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(fontSize: 12.sp),
                                border: InputBorder.none,
                              ),
                              cursorColor: Colors.purple,
                            ),
                          ),
                        ),
                        if (controller.isFilledEmail.value)
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.passwordFocusNode.hasFocus
                            ? Colors.purple
                            : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: TextFormField(
                              controller: controller.controllerPassword,
                              focusNode: controller.passwordFocusNode,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 12.sp),
                                border: InputBorder.none,
                              ),
                              cursorColor: Colors.purple,
                            ),
                          ),
                        ),
                        if (controller.isFilledPassword.value)
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 28, right: 48),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Forgot your password?',
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: BottomButtonCard(
                onPressed: () {
                  controller.login();
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
