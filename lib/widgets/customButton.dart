import 'package:flutter/material.dart';
import 'package:workshop/utils/textStyles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final double width;
  final double borderRadius;
  final IconData? icon;
  final String? prefixImage;

  CustomButton({
    super.key,
    this.text,
    required this.borderRadius,
    required this.width,
    required this.onPressed,
    this.color,
    this.textColor,
    this.icon,
    this.prefixImage,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        maximumSize: Size(width, 48),
      ),
      child: Center(
        child: prefixImage != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    prefixImage!,
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text!,
                    style: textStyle(
                      fontSize,
                      textColor ?? Colors.white,
                      FontWeight.w500,
                      0.4,
                    ),
                  ),
                ],
              )
            : icon != null
                ? Icon(
                    icon,
                    color: textColor,
                    size: fontSize,
                  )
                : Text(
                    text!,
                    style: textStyle(
                      fontSize,
                      textColor ?? Colors.white,
                      FontWeight.w500,
                      0,
                    ),
                  ),
      ),
    );
  }
}
