import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/actor_images_usecase.dart';
import 'actor_images_event.dart';
import 'actor_images_state.dart';


class ActorImagesBloc extends Bloc<ActorImagesEvent, ActorImagesState> {
  final GetActorImagesUseCase getActorUseCase;

  ActorImagesBloc(this.getActorUseCase) : super(ActorImagesInitial()) {
    on<FetchActorImages>((event, emit) async {
      emit(ActorImagesLoading());

      try {
        if (event.actorId == null) {
          emit(const ActorImagesError("actorId is null"));
          return;
        }

        final actorImages = await getActorUseCase.call(event.actorId!);

        if (actorImages == null) {
          emit(const ActorImagesError("Actor images are null"));
          return;
        }

        log("Actor images fetched: ${actorImages.profiles?.length ?? 0}");
        emit(ActorImagesLoaded(actorImages));

      } catch (e, s) {
        log("BLOC ERROR: $e");
        log("STACKTRACE: $s");
        emit(ActorImagesError(e.toString()));
      }
    });

  }
}
