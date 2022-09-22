import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'main_frame_event.dart';
import 'main_frame_state.dart';
export 'main_frame_event.dart';
export 'main_frame_state.dart';

final $MainFrameBloc = GetIt.I.registerSingleton<MainFrameBloc>(
  MainFrameBloc(),
);

class MainFrameBloc extends Bloc<MainFrameEvent, MainFrameState> {
  MainFrameBloc() : super(MFHomeViewState()) {
    on<MFTapHomeEvent>((event, emit) {
      emit(MFHomeViewState());
    });

    on<MFTapFavoriteEvent>((event, emit) {
      emit(MFFavoriteViewState());
    });

    on<MFTapPopularEvent>((event, emit) {
      emit(MFPopularViewState());
    });

    on<MFTapMovieEvent>((event, emit) {
      emit(MFMovieViewState(event.movie));
    });
  }
}
