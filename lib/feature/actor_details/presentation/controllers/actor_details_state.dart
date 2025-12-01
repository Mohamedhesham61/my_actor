import 'package:equatable/equatable.dart';

import '../../data/models/actor_details_model.dart';

abstract class ActorDetailsState extends Equatable {
  const ActorDetailsState();

  @override
  List<Object?> get props => [];
}

class ActorDetailsInitial extends ActorDetailsState {}

class ActorDetailsLoading extends ActorDetailsState {}

class ActorDetailsLoaded extends ActorDetailsState {
  final ActorDetailsModel actorDetails;

  const ActorDetailsLoaded(this.actorDetails);
}

class ActorDetailsError extends ActorDetailsState {
  final String message;

  const ActorDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
