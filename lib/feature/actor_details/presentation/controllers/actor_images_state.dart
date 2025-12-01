import 'package:equatable/equatable.dart';
import '../../data/models/actor_images_model.dart';

abstract class ActorImagesState extends Equatable {
  const ActorImagesState();

  @override
  List<Object?> get props => [];
}

class ActorImagesInitial extends ActorImagesState {}

class ActorImagesLoading extends ActorImagesState {}

class ActorImagesLoaded extends ActorImagesState {
  final ActorImagesModel actorImages;

  const ActorImagesLoaded(this.actorImages);
}

class ActorImagesError extends ActorImagesState {
  final String message;

  const ActorImagesError(this.message);

  @override
  List<Object?> get props => [message];
}