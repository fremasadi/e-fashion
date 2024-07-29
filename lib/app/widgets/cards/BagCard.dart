import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/entities/OrderDetail.dart';
import '../../data/entities/products.dart';

class BagCard extends StatelessWidget {
  final OrderDetail orderDetail;
  final Product product;

  const BagCard({
    super.key,
    required this.orderDetail,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                product.image, // Use the image URL from the product
                width: 104.w,
                height: 104.h,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name, // Use the product name
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Metro-SemiBold',
                      ),
                    ),
                    Row(
                      children: [
                        Text('Color: ${orderDetail.color}'),
                        SizedBox(width: 11.w),
                        Text('Size: ${orderDetail.size}'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '${orderDetail.quantity}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Metro-Medium',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
                Text(
                  '\$${(orderDetail.quantity * product.originalPrice).toStringAsFixed(2)}', // Ensure double formatting
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
