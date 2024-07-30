import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:fashion_ecommerce/app/widgets/cards/BottomButtonCard.dart';
import 'package:fashion_ecommerce/app/widgets/cards/HorizontalCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/entities/OrderDetail.dart';
import '../../../data/entities/products.dart';
import '../../../widgets/cards/BagCard.dart';
import '../controllers/bag_controller.dart';

class BagView extends GetView<BagController> {
  const BagView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        height: 200.h,
        color: AppColor.white,
        child: Column(
          children: [
            HorizontalCard(
              title: 'Enter your promo code',
              icon: Icons.arrow_forward,
              onPressed: () {},
              width: context.width,
              borderColor: AppColor.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: FutureBuilder<List<OrderDetail>>(
                future: controller.fetchOrderDetails(),
                builder: (context, orderDetailsSnapshot) {
                  if (orderDetailsSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (orderDetailsSnapshot.hasError) {
                    return Center(
                        child: Text('Error: ${orderDetailsSnapshot.error}'));
                  } else if (!orderDetailsSnapshot.hasData ||
                      orderDetailsSnapshot.data!.isEmpty) {
                    return const Center(child: Text('No items in your bag.'));
                  }

                  return FutureBuilder<List<Product>>(
                    future: controller.fetchProducts(),
                    builder: (context, productsSnapshot) {
                      if (productsSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (productsSnapshot.hasError) {
                        return Center(
                            child: Text('Error: ${productsSnapshot.error}'));
                      } else if (!productsSnapshot.hasData ||
                          productsSnapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No products available.'));
                      }

                      List<OrderDetail> orderDetails =
                          orderDetailsSnapshot.data!;
                      List<Product> products = productsSnapshot.data!;

                      double totalAmount =
                          controller.getTotalAmount(orderDetails, products);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total amount:',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Metro-Medium',
                              color: AppColor.grey,
                            ),
                          ),
                          Text(
                            '\$${totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Metro-SemiBold',
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            BottomButtonCard(
              onPressed: () {},
              title: 'CHECK OUT',
              textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Metro-Medium',
                  color: AppColor.white),
              heightContainer: 48.sp,
              backgroundColor: AppColor.primary,
              borderColor: null,
              radiusBorder: 48,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<OrderDetail>>(
          future: controller.fetchOrderDetails(),
          builder: (context, orderDetailsSnapshot) {
            if (orderDetailsSnapshot.connectionState ==
                ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (orderDetailsSnapshot.hasError) {
              return Center(
                  child: Text('Error: ${orderDetailsSnapshot.error}'));
            } else if (!orderDetailsSnapshot.hasData ||
                orderDetailsSnapshot.data!.isEmpty) {
              return const Center(child: Text('No items in your bag.'));
            }

            return FutureBuilder<List<Product>>(
              future: controller.fetchProducts(),
              builder: (context, productsSnapshot) {
                if (productsSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (productsSnapshot.hasError) {
                  return Center(
                      child: Text('Error: ${productsSnapshot.error}'));
                } else if (!productsSnapshot.hasData ||
                    productsSnapshot.data!.isEmpty) {
                  return const Center(child: Text('No products available.'));
                }

                List<OrderDetail> orderDetails = orderDetailsSnapshot.data!;
                List<Product> products = productsSnapshot.data!;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 58.0, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.search, size: 32.sp),
                          ],
                        ),
                      ),
                      Text(
                        'My Bag',
                        style: TextStyle(
                          fontSize: 34.sp,
                          fontFamily: 'Metro-Bold',
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderDetails.length,
                        itemBuilder: (context, index) {
                          OrderDetail orderDetail = orderDetails[index];
                          Product product = products
                              .firstWhere((p) => p.id == orderDetail.productId);
                          return BagCard(
                            orderDetail: orderDetail,
                            product: product,
                            onUpdateQuantity: (updatedOrderDetail) {
                              controller.updateOrderDetail(updatedOrderDetail);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 200.h,
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
