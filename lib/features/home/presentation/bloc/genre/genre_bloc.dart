import 'package:flutter_bloc/flutter_bloc.dart';

import 'genre_event.dart';
import 'genre_state.dart';
export 'genre_event.dart';
export 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreContainerInvisible()) {
    on<GenreShowContainer>((event, emit) => emit(GenreContainerVisible()));
    on<GenreHideContainer>((event, emit) => emit(GenreContainerInvisible()));
  }
}
