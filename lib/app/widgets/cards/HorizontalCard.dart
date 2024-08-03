import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.onPressed,
    this.icon,
    required this.width,
    this.borderColor,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onPressed;
  final double width;
  final IconData? icon;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon == null)
                Expanded(
                  child: Center(
                    child: subtitle == null
                        ? Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Metro-Medium',
                              fontSize: 14.sp,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontFamily: 'Metro-Medium',
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                subtitle!,
                                style: TextStyle(
                                  fontFamily: 'Metro-Medium',
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                  ),
                )
              else ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Metro-Medium',
                        fontSize: 14.sp,
                      ),
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: 4.h),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontFamily: 'Metro-Medium',
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ],
                ),
                Icon(
                  icon,
                  size: 20.sp,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
