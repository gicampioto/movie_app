import 'package:equatable/equatable.dart';

import '../../../core/domain/entity/movie_entity.dart';

abstract class MainFrameState extends Equatable {}

class MFHomeViewState extends MainFrameState {
  @override
  List<Object?> get props => [null];
}

class MFFavoriteViewState extends MainFrameState {
  @override
  List<Object?> get props => [null];
}

class MFPopularViewState extends MainFrameState {
  @override
  List<Object?> get props => [null];
}

class MFMovieViewState extends MainFrameState {
  MFMovieViewState(this.movie);

  final MovieEntity movie;

  @override
  List<Object?> get props => [null];
}
