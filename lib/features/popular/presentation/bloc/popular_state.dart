import 'package:equatable/equatable.dart';

import '../../../../core/domain/entity/movie_entity.dart';

abstract class PopularState extends Equatable {}

class PopularInitialState extends PopularState {
  @override
  List<Object?> get props => [null];
}

class PopularLoadingState extends PopularState {
  @override
  List<Object?> get props => [null];
}

class PopularErrorState extends PopularState {
  PopularErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class PopularDataFetchedState extends PopularState {
  PopularDataFetchedState({
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  List<Object?> get props => [movies];
}
