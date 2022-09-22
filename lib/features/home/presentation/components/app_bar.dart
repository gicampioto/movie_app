import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';

AppBar homeAppBar() {
  return AppBar(
    elevation: 0,
    toolbarHeight: AppSizes.bars / 2,
    actions: const [
      Text('??'),
    ],
  );
}
