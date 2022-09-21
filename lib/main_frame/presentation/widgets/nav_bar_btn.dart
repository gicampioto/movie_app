import 'package:flutter/material.dart';

import '../../../design_system/widgets/icon_btn.dart';

class NavBarBtn extends StatelessWidget {
  const NavBarBtn({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  factory NavBarBtn.home() {
    return const NavBarBtn(icon: Icons.home);
  }

  factory NavBarBtn.favorite() {
    return const NavBarBtn(icon: Icons.favorite);
  }

  factory NavBarBtn.popular() {
    return const NavBarBtn(icon: Icons.star);
  }

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.white;

    return Container(
      width: 100,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 3.0,
          ),
        ),
      ),
      child: IconBtn(
        tap: () {},
        icon: icon,
        iconColor: color,
      ),
    );
  }
}
