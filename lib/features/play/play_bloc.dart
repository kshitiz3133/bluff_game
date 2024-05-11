import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_event.dart';

part 'play_state.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  PlayBloc() : super(PlayInitial()) {
    on<PlayInitialEvent>(playInitialEvent);
    on<PlayBluffButtonEvent>(playBluffButtonEvent);
  }

  FutureOr<void> playInitialEvent(PlayInitialEvent event, Emitter<PlayState> emit) async {
    emit(PlayLoadingState());
    await Future.delayed(Duration(seconds: 4));
    emit(PlayLoadedSuccessState());
  }

  FutureOr<void> playBluffButtonEvent(
      PlayBluffButtonEvent event, Emitter<PlayState> emit) {
    print("bluff");
    emit(PlayCardsOnTable());
  }


}
