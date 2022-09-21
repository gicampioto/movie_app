import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';

import '../../../design_system/widgets/icon_btn.dart';

AppBar appBar() {
  const padding = SizedBox(width: AppSizes.padding);

  const Widget title = Center(
    child: Text(
      'Movie App',
      style: TextStyle(fontSize: 24),
    ),
  );

  Widget themeBtn = IconBtn(
    tap: () {},
    icon: Icons.sunny,
  );

  return AppBar(
    toolbarHeight: AppSizes.barSizes,
    actions: [
      padding,
      title,
      const Spacer(),
      themeBtn,
      padding,
    ],
  );
}
