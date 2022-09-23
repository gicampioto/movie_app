import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/entity/page_entity.dart';
import '../../../../../core/errors/app_base_error.dart';
import '../../../domain/use_case/get_movies_by_genre_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';
export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMoviesByGenre getMoviesByGenre;

  HomeBloc(this.getMoviesByGenre) : super(HomeInitialState()) {
    on<HomeRequestMovies>((event, emit) async {
      emit(HomeLoadingState());

      try {
        var genre = event.genre ?? '18';

        PageEntity page = await getMoviesByGenre(genre, 1);

        emit(HomeDataFetchedState(
          currentPage: page.currentPage,
          totalPages: page.totalPages,
          movies: page.movies,
          genre: genre,
        ));
      } catch (e) {
        if (e is AppBaseError) {
          emit(HomeErrorState(e.message));
        } else {
          emit(HomeErrorState('Erro desconhecido'));
        }
      }
    });
  }
}
