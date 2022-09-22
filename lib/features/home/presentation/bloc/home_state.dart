import 'package:equatable/equatable.dart';

import '../../../../core/domain/entity/movie_entity.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [null];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [null];
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class HomeDataFetchedState extends HomeState {
  HomeDataFetchedState({
    required this.currentPage,
    required this.totalPages,
    required this.movies,
  });

  final String currentPage;
  final int totalPages;
  final List<MovieEntity> movies;

  @override
  List<Object?> get props => [currentPage, totalPages, movies];
}
