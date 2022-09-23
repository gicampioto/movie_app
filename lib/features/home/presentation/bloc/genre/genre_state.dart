import 'package:equatable/equatable.dart';

abstract class GenreState extends Equatable {}

class GenreContainerVisible extends GenreState {
  @override
  List<Object?> get props => [];
}

class GenreContainerInvisible extends GenreState {
  @override
  List<Object?> get props => [];
}
