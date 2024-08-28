import 'package:flutter/material.dart';

class CustomPageRouter extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRouter({
    required this.child,
    this.direction = AxisDirection.left,
    RouteSettings? settings,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) {
            return child;
          },
          reverseTransitionDuration: const Duration(milliseconds: 200),
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(begin: getBeginOffset(), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
      default:
        return const Offset(0, 0);
    }
  }
}
