import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget? mobileScreen;
  final Widget? tabScreen;
  final Widget? webScreen;

  const ResponsiveLayoutBuilder({
    this.mobileScreen,
    super.key,
    this.tabScreen,
    this.webScreen,
  });

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isTabScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
           MediaQuery.of(context).size.width < 1100;
  }

  static bool isWebScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          if (webScreen != null) {
            return webScreen!;
          }
        } else if (constraints.maxWidth >= 800) {
          if (tabScreen != null) {
            return tabScreen!;
          }
        } else {
          if (mobileScreen != null) {
            return mobileScreen!;
          }
        }
        // Fallback widget in case none of the conditions meet
        return  const Center(
          child: Text('No screen layout available'),
        );
      },
    );
  }
}
