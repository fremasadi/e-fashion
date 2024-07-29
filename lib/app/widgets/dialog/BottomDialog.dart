import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomDialog extends StatelessWidget {
  const BottomDialog({super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/ic_horizontal.png',
            ),
            Center(child: SizedBox(height: 16.h)),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Metro-SemiBold',
                ),
              ),
            ),
            SizedBox(height: 8.h),
            widget
          ],
        ),
      ),
    );
  }
}
