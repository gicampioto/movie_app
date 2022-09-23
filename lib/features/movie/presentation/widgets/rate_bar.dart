import 'package:flutter/material.dart';

class RateBar extends StatelessWidget {
  const RateBar(this.rate, {Key? key}) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height * 6,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _starIcon(rate >= 2),
          _starIcon(rate >= 4),
          _starIcon(rate >= 6),
          _starIcon(rate >= 8),
          _starIcon(rate >= 8),
        ],
      ),
    );
  }
}

Widget _starIcon(bool starOn) {
  return Icon(
    Icons.star,
    size: height * 0.9,
    color: starOn ? Colors.yellow : Colors.white,
  );
}

double width = 100;
double height = 20;
