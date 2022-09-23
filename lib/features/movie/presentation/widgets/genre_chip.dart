import 'package:flutter/material.dart';

import '../../../../design_system/utils/style.dart';

class GenreChip extends StatelessWidget {
  const GenreChip(this.genre, {Key? key}) : super(key: key);

  final String? genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        genre ?? '',
        style: TextStyles.tini,
      ),
    );
  }
}
