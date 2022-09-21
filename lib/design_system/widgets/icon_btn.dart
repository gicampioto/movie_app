import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    super.key,
    this.tap,
    required this.icon,
    this.bgColor = Colors.transparent,
    this.iconColor = Colors.white,
  });

  final Function()? tap;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: BtnSizes.icon,
        height: BtnSizes.icon,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
