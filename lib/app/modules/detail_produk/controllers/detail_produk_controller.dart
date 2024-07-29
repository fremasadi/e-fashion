import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/dialog/BottomDialog.dart';

class DetailProdukController extends GetxController {
  var selectedSize = ''.obs;
  var selectedColorName = ''.obs;

  void showBottomDialogSize() {
    final context = Get.context!;
    showModalBottomSheet(
      backgroundColor: const Color(0xffFFFFFF),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return BottomDialog(
          title: 'Select size',
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: List.generate(
                sizes.length,
                (index) => SizeCard(
                  title: sizes[index],
                  isSelected: selectedSize.value == sizes[index],
                  onPressed: () {
                    selectedSize.value = sizes[index];
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showBottomDialogColor() {
    final context = Get.context!;
    showModalBottomSheet(
      backgroundColor: const Color(0xffFFFFFF),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return BottomDialog(
          title: 'Select color',
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: List.generate(
                colorNames.length,
                (index) => ColorCard(
                  colorName: colorNames[index],
                  isSelected: selectedColorName.value == colorNames[index],
                  onPressed: () {
                    selectedColorName.value = colorNames[index];
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

const sizes = ['XS', 'S', 'M', 'L', 'XL'];
const colorNames = ['Red', 'Green', 'Blue', 'Yellow', 'Purple'];
const colorValues = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
];

class SizeCard extends StatelessWidget {
  const SizeCard({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.black,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Metro-Medium',
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.colorName,
    required this.onPressed,
    required this.isSelected,
  });

  final String colorName;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 100.w, // Adjust width to fit the text
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.black,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            colorName,
            style: TextStyle(
              fontFamily: 'Metro-Medium',
              fontSize: 14.sp,
              color: isSelected
                  ? Colors.purple
                  : Colors.black, // Text color change on selection
            ),
          ),
        ),
      ),
    );
  }
}
