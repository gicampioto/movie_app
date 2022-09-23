import 'package:flutter/material.dart';

import '../../../../design_system/utils/genre_list.dart';
import '../widgets/genre_chip.dart';

class GenresContainer extends StatelessWidget {
  const GenresContainer(this.genreIds, {super.key});

  final List<int> genreIds;

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = [];

    int i = 0;

    for (var genre in genreIds) {
      if (i < 2) {
        chips.add(GenreChip(genreList[genre]));
        chips.add(const SizedBox(width: 5));
      }
      i++;
    }

    return Row(
      children: chips,
    );
  }
}
