import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/entity/movie_entity.dart';
import 'package:movie_app/features/movie/presentation/components/summary.dart';

import '../../../../design_system/utils/sizes.dart';
import '../../../../design_system/utils/style.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Summary(movie),
        Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Text(
            movie.overview ?? 'Filme não possui sinopse em português',
            style: const TextStyle(
                fontSize: FontSizes.text, color: AppColors.darkPink),
          ),
        ),
      ],
    );
  }
}
