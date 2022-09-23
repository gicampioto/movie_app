import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomeRequestMovies extends HomeEvent {
  HomeRequestMovies(this.genre, this.page);

  final String? genre;
  final int page;

  @override
  List<Object?> get props => [genre];
}
