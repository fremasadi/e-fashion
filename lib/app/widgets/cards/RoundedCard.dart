import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedCard extends StatelessWidget {
  const RoundedCard({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontFamily: 'Metro-Medium',
            ),
          ),
        ),
      ),
    );
  }
}
