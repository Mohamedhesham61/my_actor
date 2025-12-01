import 'package:equatable/equatable.dart';

abstract class ActorDetailsEvent extends Equatable {
  const ActorDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchActorDetails extends ActorDetailsEvent {
  final int? actorId;

  const FetchActorDetails(this.actorId);

  @override
  List<Object> get props => [actorId ?? 0];
}
