import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/entity/movie_entity.dart';

import '../../../../design_system/utils/sizes.dart';
import '../../../../design_system/utils/style.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key, required this.movie});

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

    const pad = AppSizes.halfPadding;
    const gapRow = SizedBox(width: AppSizes.padding);
    const gapColumn = SizedBox(height: AppSizes.halfPadding);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.pink,
        child: ListView(
          children: [
            Container(
              color: Colors.green,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (poster != null) poster,
                  gapRow,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Titulo: ${movie.title}', style: TextStyles.title),
                        gapColumn,
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Text(movie.overview),
            Container(
              height: 100,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
