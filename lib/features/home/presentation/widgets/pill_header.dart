import 'package:flutter/material.dart';

import '../../../../design_system/utils/sizes.dart';

class PillHeader extends StatelessWidget {
  const PillHeader(this.constraints, {super.key});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    Widget title = const Text(
      'Ação',
      style: TextStyle(
        fontSize: 18,
        color: Colors.green,
        fontWeight: FontWeight.w500,
      ),
    );

    return Positioned(
      top: 5,
      width: constraints.maxWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            height: 25,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: title,
          ),
        ],
      ),
    );
  }
}
