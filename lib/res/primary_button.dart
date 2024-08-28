import 'package:flutter/material.dart';
import 'barrel_file.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? blurRadius;
  final Widget? child;
  final String? text;
  final void Function() onTap;

  const PrimaryButton({
    this.text,
    required this.onTap,
    this.borderColor,
    this.color,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.blurRadius,
    this.borderWidth,
    this.radius,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? kStandardPadding(),
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth ?? 0,
            color: borderColor ?? primaryColor,
          ),
          color: color ?? primaryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
        ),
        height: height,
        width: width,
        child: Center(
          child: child ?? 
            Text(
              text ?? '',
              style: kButtonTextStyle().copyWith(color: whiteColor),
            ),
        ),
      ),
    );
  }
}
