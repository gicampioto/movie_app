import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/design_system/components/genre_chip_container.dart';

import '../../../../core/domain/entity/movie_entity.dart';
import '../../../../design_system/utils/sizes.dart';
import '../../../../design_system/utils/style.dart';
import '../../../../main_frame/presentation/bloc/main_frame_bloc.dart';
import '../../../movie/presentation/widgets/rate_bar.dart';

class PopMovieCard extends StatelessWidget {
  const PopMovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    Widget? poster;

    if (movie.imagePath != null) {
      var image = movie.imagePath;
      poster = SizedBox(
        child: Image.network(
          'https://image.tmdb.org/t/p/original/$image',
          fit: BoxFit.contain,
        ),
      );
    }

    const pad = AppSizes.halfPadding;

    return Center(
      child: GestureDetector(
        onTap: () => context.read<MainFrameBloc>().add(MFTapMovieEvent(movie)),
        child: Container(
          padding: const EdgeInsets.all(pad),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.lightPink,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (poster != null) poster,
              Text(
                movie.title != null ? movie.title! : '',
                style: TextStyles.titleCard,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Center(child: GenreChipContainer(movie.genreIDs, middle: true)),
              RateBar(movie.rate ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}
