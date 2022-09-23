import 'package:flutter/material.dart';

import '../utils/sizes.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({
    Key? key,
    required this.crossCount,
    required this.children,
    this.gap,
  }) : super(key: key);

  final int crossCount;
  final List<Widget> children;
  final double? gap;

  factory MovieGrid.home({required List<Widget> children}) {
    return MovieGrid(crossCount: 3, gap: 40, children: children);
  }

  factory MovieGrid.popular({required List<Widget> children}) {
    return MovieGrid(crossCount: 2, children: children);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(
        left: AppSizes.padding,
        right: AppSizes.padding,
        bottom: AppSizes.padding,
        top: gap ?? AppSizes.padding,
      ),
      crossAxisCount: crossCount,
      crossAxisSpacing: AppSizes.halfPadding,
      mainAxisSpacing: AppSizes.padding,
      childAspectRatio: 1 / 2,
      children: children,
    );
  }
}
