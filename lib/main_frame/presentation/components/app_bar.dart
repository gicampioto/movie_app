import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';

AppBar appBar() {
  const padding = SizedBox(width: AppSizes.padding);
  const color = Colors.white;

  return AppBar(
    actions: [
      padding,
      const Center(
        child: Text(
          'Movie App',
          style: TextStyle(fontSize: 24),
        ),
      ),
      const Spacer(),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.sunny,
          size: BtnSizes.icon,
          color: color,
        ),
      ),
      padding,
    ],
  );
}
