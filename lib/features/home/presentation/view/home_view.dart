import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/design_system/utils/genre_list.dart';

import '../bloc/genre/genre_bloc.dart';
import '../components/search_genres_container.dart';
import '../../../../design_system/components/movie_grid.dart';
import '../../../../core/domain/entity/movie_entity.dart';
import '../bloc/home/home_bloc.dart';
import '../components/movie_card.dart';
import '../components/header.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc homeBloc;
  late GenreBloc genreBloc;

  @override
  void initState() {
    super.initState();

    homeBloc = HomeBloc(GetIt.I());
    genreBloc = GenreBloc();
  }

  @override
  void dispose() {
    // bloc.close;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: Scaffold(
        // backgroundColor: AppColors.pink,
        body: LayoutBuilder(builder: (context, constraints) {
          return BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, state) {
              if (state is HomeInitialState) {
                homeBloc.add(HomeRequestMovies('18'));
              }

              if (state is HomeDataFetchedState) {
                return Stack(
                  children: [
                    //TODO: colocar o contador de paginas
                    MovieGrid.home(children: _gridCards(state.movies)),
                    HomeHeader(
                      constraints,
                      genre: genresName[state.genre],
                      bloc: genreBloc,
                    ),
                    BlocBuilder<GenreBloc, GenreState>(
                      bloc: genreBloc,
                      builder: (context, state) {
                        if (state is GenreContainerVisible) {
                          return SearchGenresContainer(genreBloc);
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                );
              }

              if (state is HomeErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is HomeLoadingState) {
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
        }),
      ),
    );
  }
}

List<Widget> _gridCards(List<MovieEntity> movies) {
  List<Widget> moviesList = [];

  for (var movie in movies) {
    moviesList.add(HomeMovieCard(movie: movie));
  }

  return moviesList;
}
