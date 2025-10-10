import 'package:eshop/core/themes/my_color.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    this.borderRadius,
    this.height,
    this.width,
    this.backgroundColor,
    required this.text,
    required this.textStyle,
    required this.onPressed,
  });

  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final String text;
  final TextStyle textStyle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 16),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? MyColor.myBlue,
        ),
        fixedSize: WidgetStateProperty.all(
          Size(width ?? double.maxFinite, height ?? 60),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}
