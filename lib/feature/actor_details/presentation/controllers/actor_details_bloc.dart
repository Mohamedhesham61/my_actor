import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/actor_details_usecase.dart';
import 'actor_details_event.dart';
import 'actor_details_state.dart';


class ActorDetailsBloc extends Bloc<ActorDetailsEvent, ActorDetailsState> {
  final GetActorDetailsUseCase getActorUseCase;

  ActorDetailsBloc(this.getActorUseCase) : super(ActorDetailsInitial()) {
    on<FetchActorDetails>((event, emit) async {
      emit(ActorDetailsLoading());
      try {
        final actor = await getActorUseCase.call(event.actorId ?? 0);
        emit(ActorDetailsLoaded(actor));

      } catch (e) {
        emit(ActorDetailsError(e.toString()));
      }
    });
  }
}
