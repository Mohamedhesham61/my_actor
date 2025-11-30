
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/actors_list_model.dart';
import '../../domain/usecases/get_actors_list_usecase.dart';
import 'actor_list_event.dart';
import 'actor_list_state.dart';

class ActorsListBloc extends Bloc<ActorsListEvent, ActorsListState> {
  final GetPopularActorsUseCase getPopularActors;

  ActorsListBloc(this.getPopularActors) : super(ActorsListInitial()) {
    on<FetchActorsList>((event, emit) async {
      emit(ActorsListLoading());
      try {
        final data = await getPopularActors.call(pageNumber: 1);
        emit(
          ActorsListLoaded(
            actorsList: data.results ?? [],
            currentPage: data.page ?? 1,
            totalPages: data.totalPages ?? 1,
            isLoadingMore: false,
          ),
        );
      } catch (e) {
        emit(ActorsListError(e.toString()));
      }
    });

    on<LoadMoreActors>((event, emit) async {
      final currentState = state;
      if (currentState is! ActorsListLoaded) return;

      if (currentState.currentPage >= currentState.totalPages || currentState.isLoadingMore) return;
      final nextPage = currentState.currentPage + 1;

      emit(currentState.copyWith(isLoadingMore: true));

      try {
        final data = await getPopularActors.call(pageNumber: nextPage);

        final newResults = (data.results ?? <Results>[])
            .map((e) => e as Results)
            .toList();

        final updatedList = [...currentState.actorsList, ...newResults];
        emit(currentState.copyWith(
          actorsList: updatedList,
          currentPage: nextPage,
          isLoadingMore: false,
        ));
      } catch (e) {
        emit(currentState.copyWith(isLoadingMore: false));
        emit(ActorsListError(e.toString()));
      }
    });
  }
}
