import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/entity/movie_entity.dart';

abstract class MainFrameEvent extends Equatable {}

class MFTapHomeEvent extends MainFrameEvent {
  @override
  List<Object?> get props => [];
}

class MFTapPopularEvent extends MainFrameEvent {
  @override
  List<Object?> get props => [];
}

class MFTapFavoriteEvent extends MainFrameEvent {
  @override
  List<Object?> get props => [];
}

class MFTapMovieEvent extends MainFrameEvent {
  MFTapMovieEvent(this.movie);

  final MovieEntity movie;

  @override
  List<Object?> get props => [];
}
