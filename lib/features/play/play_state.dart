part of 'play_bloc.dart';

@immutable
sealed class PlayState {}

abstract class PlayActionState extends PlayState {}

final class PlayInitial extends PlayState {}

class PlayLoadingState extends PlayState {}

class PlayLoadedSuccessState extends PlayState{}

class PlayCardsOnTable extends PlayActionState{}