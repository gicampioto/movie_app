import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';
import 'package:movie_app/main_frame/presentation/widgets/nav_bar_btn.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: AppSizes.doublePadding + BtnSizes.icon,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavBarBtn.popular(),
            NavBarBtn.home(),
            NavBarBtn.favorite(),
          ],
        ),
      ),
    );
  }
}
