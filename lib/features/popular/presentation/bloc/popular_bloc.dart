import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/entity/movie_entity.dart';

import '../../../../core/errors/app_base_error.dart';
import '../../domain/use_case/get_popular_movies_use_case.dart';
import 'popular_event.dart';
import 'popular_state.dart';
export 'popular_event.dart';
export 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final GetPopularMovies getPopularMovies;

  PopularBloc(this.getPopularMovies) : super(PopularInitialState()) {
    on<PopularRequestMovies>((event, emit) async {
      emit(PopularLoadingState());

      try {
        List<MovieEntity> movies = await getPopularMovies();

        emit(PopularDataFetchedState(
          movies: movies,
        ));
      } catch (e) {
        if (e is AppBaseError) {
          emit(PopularErrorState(e.message));
        } else {
          emit(PopularErrorState('Erro desconhecido'));
        }
      }
    });
  }
}
