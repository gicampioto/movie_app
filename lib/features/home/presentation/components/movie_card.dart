import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entity/movie_entity.dart';
import '../../../../design_system/utils/sizes.dart';
import '../../../../design_system/utils/style.dart';
import '../../../../main_frame/presentation/bloc/main_frame_bloc.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (poster != null) poster,
              const Spacer(),
              Text(
                movie.title != null ? movie.title! : '',
                style: TextStyles.titleCard,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
