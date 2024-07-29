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
      body: FutureBuilder<List<OrderDetail>>(
        future: controller.fetchOrderDetails(),
        builder: (context, orderDetailsSnapshot) {
          if (orderDetailsSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (orderDetailsSnapshot.hasError) {
            return Center(child: Text('Error: ${orderDetailsSnapshot.error}'));
          } else if (!orderDetailsSnapshot.hasData ||
              orderDetailsSnapshot.data!.isEmpty) {
            return Center(child: Text('No items in your bag.'));
          }

          return FutureBuilder<List<Product>>(
            future: controller.fetchProducts(),
            builder: (context, productsSnapshot) {
              if (productsSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (productsSnapshot.hasError) {
                return Center(child: Text('Error: ${productsSnapshot.error}'));
              } else if (!productsSnapshot.hasData ||
                  productsSnapshot.data!.isEmpty) {
                return Center(child: Text('No products available.'));
              }

              List<OrderDetail> orderDetails = orderDetailsSnapshot.data!;
              List<Product> products = productsSnapshot.data!;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orderDetails.length,
                        itemBuilder: (context, index) {
                          OrderDetail orderDetail = orderDetails[index];
                          Product product = products
                              .firstWhere((p) => p.id == orderDetail.productId);
                          return BagCard(
                              orderDetail: orderDetail, product: product);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
