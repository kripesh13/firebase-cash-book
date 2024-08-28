import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget destopScreen;
  final Widget tabScreen;

  const ResponsiveLayout(
      {super.key,
      required this.destopScreen,
      required this.mobileScreen,
      required this.tabScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return mobileScreen;
      } else if (constraints.maxWidth < 800 && constraints.maxWidth > 451) {
        return tabScreen;
      } else {
        return destopScreen;
      }
    });
  }
}
