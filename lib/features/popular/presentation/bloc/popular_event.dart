import 'package:equatable/equatable.dart';

abstract class PopularEvent extends Equatable {}

class PopularRequestMovies extends PopularEvent {
  @override
  List<Object?> get props => [null];
}
