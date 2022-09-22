import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/design_system/utils/style.dart';

import '../../../../core/domain/entity/movie_entity.dart';
import '../../../../design_system/utils/sizes.dart';
import '../bloc/home_bloc.dart';
import '../components/movie_card.dart';
import '../widgets/pill_header.dart';

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
                bloc.add(HomeRequestMovies());
              }

              if (state is HomeDataFetchedState) {
                return Stack(
                  children: [
                    const SizedBox(height: 20),
                    //TODO: melhorar o tamanho dos containers
                    LayoutBuilder(builder: (context, constraints) {
                      var cardWidth =
                          (constraints.maxWidth - AppSizes.padding) / 3;

                      return GridView.count(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSizes.padding,
                          horizontal: AppSizes.padding,
                        ),
                        crossAxisCount: 3,
                        crossAxisSpacing: AppSizes.halfPadding,
                        mainAxisSpacing: AppSizes.padding,
                        childAspectRatio: 1 / 1.8,
                        children: _gridCards(state.movies, cardWidth),
                      );
                    }),
                    //TODO: colocar o contador de paginas
                    PillHeader(constraints),
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

List<Widget> _gridCards(List<MovieEntity> movies, double cardWidth) {
  List<Widget> moviesList = [];

  for (var movie in movies) {
    moviesList.add(HomeMovieCard(movie: movie, width: cardWidth));
  }

  return moviesList;
}
