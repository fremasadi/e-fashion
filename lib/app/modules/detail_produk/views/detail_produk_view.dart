import 'package:fashion_ecommerce/app/style/app_color.dart';
import 'package:fashion_ecommerce/app/widgets/cards/BottomButtonCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/cards/HorizontalCard.dart';
import '../controllers/detail_produk_controller.dart';
import '../../../data/entities/products.dart'; // Adjust import path as necessary

class DetailProdukView extends GetView<DetailProdukController> {
  const DetailProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          overlayColor: const WidgetStatePropertyAll(Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 28,
              color: AppColor.black2,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14.0),
            child: Icon(Icons.share),
          )
        ],
        title: Text(product.type),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image,
                height: 413.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => HorizontalCard(
                        title: controller.selectedSize.value.isEmpty
                            ? 'Size'
                            : controller.selectedSize.value,
                        onPressed: () {
                          controller.showBottomDialogSize();
                        },
                        icon: Icons.arrow_drop_down_sharp,
                        width: 138.w,
                      )),
                  Obx(() => HorizontalCard(
                        title: controller.selectedColorName.value.isEmpty
                            ? 'Color'
                            : controller.selectedColorName.value,
                        onPressed: () {
                          controller.showBottomDialogColor();
                        },
                        icon: Icons.arrow_drop_down_sharp,
                        width: 138.w,
                      )),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.white,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 28,
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontFamily: 'Metro-SemiBold',
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            product.isOnSale
                                ? '\$${product.originalPrice}'
                                : '\$${product.originalPrice}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'Metro-Regular',
                              decoration: product.isOnSale
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          if (product.isOnSale)
                            Text(
                              '\$${product.discountedPrice}',
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
                  Text(
                    product.type,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16.sp,
                          );
                        }),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '10',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: BottomButtonCard(
                      onPressed: () {},
                      title: 'ADD TO CART',
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Metro-Medium',
                        color: AppColor.white,
                      ),
                      heightContainer: 48.h,
                      backgroundColor: AppColor.primary,
                      borderColor: null,
                      radiusBorder: 100,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
