import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';
import 'package:movie_app/design_system/components/genres_container.dart';
import 'package:movie_app/features/movie/presentation/widgets/rate_bar.dart';

import '../../../../core/domain/entity/movie_entity.dart';
import '../../../../design_system/utils/style.dart';

class Summary extends StatelessWidget {
  const Summary(
    this.movie, {
    Key? key,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    Widget? poster;

    if (movie.imagePath != null) {
      var image = movie.imagePath;
      poster = Image.network(
        'https://image.tmdb.org/t/p/original/$image',
      );
    }

    String ano =
        movie.releaseDate != null ? movie.releaseDate!.year.toString() : 'Ano';

    return Container(
      color: AppColors.pink,
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (poster != null) poster,
          const SizedBox(width: AppSizes.halfPadding),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(movie.title ?? 'Titulo', style: TextStyles.title),
                Text(ano, style: TextStyles.text),
                RateBar(movie.rate ?? 0),
                GenresContainer(movie.genreIDs, amount: 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
