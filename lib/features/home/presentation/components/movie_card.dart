import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/entity/movie_entity.dart';
import 'package:movie_app/design_system/utils/sizes.dart';
import 'package:movie_app/design_system/utils/style.dart';
import 'package:movie_app/design_system/widgets/icon_btn.dart';

import '../../../../main_frame/presentation/bloc/main_frame_bloc.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
    Key? key,
    required this.movie,
    required this.width,
  }) : super(key: key);

  final MovieEntity movie;
  final double width;

  @override
  Widget build(BuildContext context) {
    Widget? poster;

    if (movie.imagePath != null) {
      var image = movie.imagePath;
      poster = SizedBox(
        width: width - AppSizes.padding,
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
                style: TextStyles.title,
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
