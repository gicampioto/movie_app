import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';

class TextStyles {
  static const Color textColor = Colors.white;

  static const TextStyle tini = TextStyle(
    fontSize: FontSizes.tini,
    color: AppColors.blue,
  );

  static const TextStyle text = TextStyle(
    fontSize: FontSizes.text,
    color: textColor,
  );

  static const TextStyle title = TextStyle(
    fontSize: FontSizes.title,
    color: textColor,
  );

  static const TextStyle titleCard = TextStyle(
    fontSize: FontSizes.titleCard,
    color: textColor,
  );

  static const TextStyle barTitle = TextStyle(
    fontSize: FontSizes.barTitle,
    color: textColor,
  );

  static const TextStyle genreTextBtn = TextStyle(
    fontSize: FontSizes.barTitle,
    color: textColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1,
  );
}

class AppColors {
  static const Color darkPink = Color.fromRGBO(72, 39, 40, 1);
  static const Color pink = Color.fromRGBO(126, 78, 96, 1);
  static const Color lightPink = Color.fromRGBO(178, 135, 163, 1);
  static const Color blue = Color.fromRGBO(117, 154, 171, 1);
  static const Color beige = Color.fromRGBO(254, 225, 199, 1);
}
