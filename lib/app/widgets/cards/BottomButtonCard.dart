import 'package:flutter/material.dart';

class BottomButtonCard extends StatelessWidget {
  const BottomButtonCard(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.textStyle,
      required this.heightContainer,
      required this.backgroundColor,
      required this.borderColor,
      required this.radiusBorder});

  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  final double heightContainer;
  final TextStyle textStyle;
  final double radiusBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: heightContainer,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radiusBorder),
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
