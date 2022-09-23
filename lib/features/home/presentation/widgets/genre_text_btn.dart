import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/design_system/utils/genre_list.dart';
import 'package:movie_app/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/home/home_bloc.dart';

import '../../../../design_system/utils/sizes.dart';
import '../../../../design_system/utils/style.dart';

class GenreTextBtn extends StatelessWidget {
  const GenreTextBtn(this.title, this.bloc, {Key? key}) : super(key: key);

  final String title;
  final GenreBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          bloc.add(GenreHideContainer());
          context.read<HomeBloc>().add(HomeRequestMovies(genresId[title]));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
          child: Text(
            title,
            style: TextStyles.genreTextBtn,
          ),
        ),
      ),
    );
  }
}
