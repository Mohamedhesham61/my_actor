import 'package:equatable/equatable.dart';

abstract class ActorsListEvent extends Equatable {
  const ActorsListEvent();

  @override
  List<Object> get props => [];
}

class FetchActorsList extends ActorsListEvent {}

class LoadMoreActors extends ActorsListEvent {}
