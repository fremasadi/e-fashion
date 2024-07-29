import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalProductCard extends StatelessWidget {
  final String productName;
  final String productType;
  final String productImage;
  final bool productStatusSale;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  final int reviewCount;

  const HorizontalProductCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.rating,
    required this.reviewCount,
    required this.productType,
    required this.productStatusSale,
    required this.originalPrice,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(10.0)),
            child: Image.asset(
              productImage,
              height: 120.h,
              width: 120.h,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Metro-SemiBold',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    productType,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < rating ? Colors.yellow : Colors.grey,
                            size: 16.sp,
                          );
                        }),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '($reviewCount)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        productStatusSale
                            ? '\$$originalPrice'
                            : '\$$originalPrice',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Metro-Regular',
                          decoration: productStatusSale
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      if (productStatusSale)
                        Text(
                          '\$$discountedPrice',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                            fontFamily: 'Metro-Regular',
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: productStatusSale ? Colors.red : Colors.black,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    productStatusSale ? 'SALE' : 'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: 'Metro-SemiBold',
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
