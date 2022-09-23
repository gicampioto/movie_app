import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomeRequestMovies extends HomeEvent {
  HomeRequestMovies(this.genre);

  final String? genre;

  @override
  List<Object?> get props => [genre];
}
