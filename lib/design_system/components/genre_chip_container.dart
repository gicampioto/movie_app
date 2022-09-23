import 'package:flutter/material.dart';

import '../utils/genre_list.dart';
import '../widgets/genre_chip.dart';

class GenreChipContainer extends StatelessWidget {
  const GenreChipContainer(
    this.genreIds, {
    super.key,
    this.middle = false,
    this.amount = 1,
  });

  final List<int> genreIds;
  final bool middle;
  final int amount;

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = [];

    int i = 0;

    for (var genre in genreIds) {
      if (i < amount) {
        chips.add(GenreChip(genresName[genre.toString()]));
        chips.add(const SizedBox(width: 3));
      }
      i++;
    }

    return Row(
      mainAxisAlignment:
          middle ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: chips,
    );
  }
}
