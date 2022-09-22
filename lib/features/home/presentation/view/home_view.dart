import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        var movie = state.movies[index];
                        return HomeMovieCard(
                          title: movie.title,
                          overview: movie.overview!,
                          imagePath: movie.imagePath,
                        );
                      },
                    ),
                    //TODO: colocar o contador de paginas
                    PillHeader(constraints),
                  ],
                );
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
