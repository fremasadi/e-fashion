// widgets/product_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productType;
  final String productImage;
  final bool productStatusSale;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  final int reviewCount;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.productType,
    required this.productImage,
    required this.productStatusSale,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    required this.reviewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  productImage,
                  height: 184.h,
                  width: context.width,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 8.h),
                    Text(
                      productType,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
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
                      productStatusSale
                          ? '$discountedPrice\$'
                          : '$originalPrice\$',
                      style: TextStyle(
                        color: productStatusSale ? Colors.red : Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Metro-Regular',
                        decoration: productStatusSale
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 166.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 26,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
