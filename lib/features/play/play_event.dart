part of 'play_bloc.dart';

@immutable
sealed class PlayEvent {}

class PlayInitialEvent extends PlayEvent {}

class PlayBluffButtonEvent extends PlayEvent{

}

