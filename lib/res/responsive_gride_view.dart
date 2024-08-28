import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const ResponsiveGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  static const int smallScreenCrossAxisCount = 2;
  static const int mediumScreenCrossAxisCount = 3;
  static const int largeScreenCrossAxisCount = 4;
  static const double spacing = 10.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        if (constraints.maxWidth < 600) {
          crossAxisCount = smallScreenCrossAxisCount;
        } else if (constraints.maxWidth < 1200) {
          crossAxisCount = mediumScreenCrossAxisCount;
        } else {
          crossAxisCount = largeScreenCrossAxisCount;
        }
        return Padding(
          padding: const EdgeInsets.all(spacing),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
            itemBuilder: itemBuilder,
            itemCount: itemCount,
          ),
        );
      },
    );
  }
}
