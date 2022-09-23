import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../design_system/components/movie_grid.dart';
import '../../../../core/domain/entity/movie_entity.dart';
import '../bloc/home_bloc.dart';
import '../components/movie_card.dart';
import '../components/header.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = HomeBloc(GetIt.I());
  }

  @override
  void dispose() {
    // bloc.close;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        // backgroundColor: AppColors.pink,
        body: LayoutBuilder(builder: (context, constraints) {
          return BlocBuilder<HomeBloc, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is HomeInitialState) {
                bloc.add(HomeRequestMovies('Família'));
              }

              if (state is HomeDataFetchedState) {
                return Stack(
                  children: [
                    MovieGrid.home(children: _gridCards(state.movies)),
                    //TODO: colocar o contador de paginas
                    HomeHeader(constraints, genre: state.genre),
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
