import 'package:equatable/equatable.dart';

abstract class GenreEvent extends Equatable {}

class GenreShowContainer extends GenreEvent {
  @override
  List<Object?> get props => [];
}

class GenreHideContainer extends GenreEvent {
  @override
  List<Object?> get props => [];
}
