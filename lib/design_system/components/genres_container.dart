import 'package:flutter/material.dart';

import '../utils/genre_list.dart';
import '../widgets/genre_chip.dart';

class GenresContainer extends StatelessWidget {
  const GenresContainer(
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
        chips.add(GenreChip(genreList[genre]));
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
