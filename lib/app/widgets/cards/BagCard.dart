import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/entities/OrderDetail.dart';
import '../../data/entities/products.dart';

class BagCard extends StatefulWidget {
  final OrderDetail orderDetail;
  final Product product;
  final Function(OrderDetail) onUpdateQuantity;

  const BagCard({
    super.key,
    required this.orderDetail,
    required this.product,
    required this.onUpdateQuantity,
  });

  @override
  _BagCardState createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.orderDetail.quantity;
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
    widget.orderDetail.quantity = _quantity;
    widget.onUpdateQuantity(widget.orderDetail);
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
      widget.orderDetail.quantity = _quantity;
      widget.onUpdateQuantity(widget.orderDetail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                widget.product.image,
                width: 104.w,
                height: 104.h,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Metro-SemiBold',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text('Color: ${widget.orderDetail.color}'),
                      SizedBox(width: 11.w),
                      Text('Size: ${widget.orderDetail.size}'),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          onPressed: _decreaseQuantity,
                          icon: const Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '$_quantity',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Metro-Medium',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          onPressed: _increaseQuantity,
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
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
                  '\$${(_quantity * widget.product.originalPrice).toStringAsFixed(2)}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
