import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    required this.width,
  });

  final String title;
  final VoidCallback onPressed;
  final double width;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon == null)
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Metro-Medium',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                )
              else ...[
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Metro-Medium',
                    fontSize: 14.sp,
                  ),
                ),
                Icon(
                  icon,
                  size: 28.sp,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
