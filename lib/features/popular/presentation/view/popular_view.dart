import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../design_system/components/movie_grid.dart';
import '../../../../core/domain/entity/movie_entity.dart';
import '../bloc/popular_bloc.dart';
import '../components/pop_movie_card.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  late PopularBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = PopularBloc(GetIt.I());
  }

  @override
  void dispose() {
    bloc.close;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is PopularInitialState) {
          bloc.add(PopularRequestMovies());
        }

        if (state is PopularDataFetchedState) {
          return MovieGrid.popular(children: _gridCards(state.movies));
        }

        if (state is PopularErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is PopularLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.amber,
          ),
        );
      },
    );
  }
}

List<Widget> _gridCards(List<MovieEntity> movies) {
  List<Widget> moviesList = [];

  for (var movie in movies) {
    moviesList.add(PopMovieCard(movie: movie));
  }

  return moviesList;
}

MovieEntity movie = MovieEntity(
    id: 1,
    title: 'filminho',
    overview: 'blablabla',
    rate: 4,
    releaseDate: DateTime.now(),
    genreIDs: [878, 878],
    imagePath: '53AC95HTGvFYA8ZRkGgeYo7lBRo.jpg',
    videoPath: 'video,');

List<MovieEntity> movies = [movie, movie, movie, movie];
