import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';
import 'package:movie_app/design_system/utils/style.dart';

import '../../../design_system/widgets/icon_btn.dart';

AppBar appBar({String? textTitle}) {
  const padding = SizedBox(width: AppSizes.padding);

  Widget title = Center(
    child: Text(
      textTitle ?? 'Filminhos',
      style: TextStyles.barTitle,
    ),
  );

  const Widget themeBtn = IconBtn(
    icon: Icons.sunny,
  );

  const Widget logo = IconBtn(
    icon: Icons.videocam,
  );

  return AppBar(
    elevation: 0,
    toolbarHeight: AppSizes.bars,
    backgroundColor: AppColors.pink,
    actions: [
      padding,
      logo,
      padding,
      title,
      const Spacer(),
      themeBtn,
      padding,
    ],
  );
}
