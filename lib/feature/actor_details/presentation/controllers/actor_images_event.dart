import 'package:equatable/equatable.dart';

abstract class ActorImagesEvent extends Equatable {
  const ActorImagesEvent();

  @override
  List<Object> get props => [];
}

class FetchActorImages extends ActorImagesEvent {
  final int? actorId;

  const FetchActorImages(this.actorId);

  @override
  List<Object> get props => [actorId ?? 0];
}
