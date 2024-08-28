import 'barrel_file.dart';

class ThemeContainer extends StatelessWidget {
  final double? height;
  final double? width;

  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? blurRadius;
  final double? spreadRadius;
  final Widget? child;
  final Color? boxShadowLightColor;
  final Color? boxShadowDarkColor;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  const ThemeContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.blurRadius,
    this.child,
    this.borderWidth,
    this.borderRadius,
    this.boxShadowLightColor,
    this.color,
    this.boxShadowDarkColor,
    this.spreadRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = AppConstants().appTheme;
    final themeColor = isDarkTheme ? whiteColor : darkGrey;

    return Container(
      padding: padding ?? kPadding(),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color ?? themeColor,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: Border.all(
            width: borderWidth ?? 0,
            color: isDarkTheme ? blackColor : whiteColor,
          ),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                    blurRadius: blurRadius ?? 0,
                    color: isDarkTheme
                        ? boxShadowLightColor ?? whiteColor.withOpacity(0.2)
                        : boxShadowDarkColor ?? blackColor.withOpacity(0.2),
                    offset: const Offset(2, 2),
                    spreadRadius: spreadRadius ?? 0),
              ]),
      child: child ?? Container(),
    );
  }
}
