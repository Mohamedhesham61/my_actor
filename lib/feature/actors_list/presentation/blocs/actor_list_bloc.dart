import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/actors_list_model.dart';
import '../../domain/usecases/get_actors_list_usecase.dart';
import 'actor_list_event.dart';
import 'actor_list_state.dart';

class ActorsListBloc extends Bloc<ActorsListEvent, ActorsListState> {
  final GetPopularActorsUseCase getPopularActors;

  ActorsListBloc(this.getPopularActors) : super(ActorsListInitial()) {
    /// أول لود → page 1
    on<FetchActorsList>((event, emit) async {
      emit(ActorsListLoading());
      try {
        final data = await getPopularActors.call(page: 1);
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

      // شغل spinner قبل ما تعمل request
      emit(currentState.copyWith(isLoadingMore: true));

      try {
        final data = await getPopularActors.call(page: nextPage);

        final newResults = (data.results ?? <Results>[])
            .map((e) => e as Results)
            .toList();

        final updatedList = [...currentState.actorsList, ...newResults];

        emit(currentState.copyWith(
          actorsList: updatedList,
          currentPage: nextPage,
          isLoadingMore: false, // إيقاف spinner
        ));
      } catch (e) {
        emit(currentState.copyWith(isLoadingMore: false));
        emit(ActorsListError(e.toString()));
      }
    });






    //   on<LoadMoreActors>((event, emit) async {
    //     if (state is! ActorsListLoaded) return;
    //
    //     final currentState = state as ActorsListLoaded;
    //
    //     /// لو خلّصت الصفحات → Stop
    //     if (currentState.currentPage >= currentState.totalPages) return;
    //      final nextPage = currentState.currentPage + 1;
    //     try {
    //
    //       // The use case should return an object that contains List<Results>
    //       final data = await getPopularActors.call(page: nextPage);
    //
    //       // SOLUTION: Explicitly ensure the results from the new page are treated as List<Results>
    //       // 1. Get the new results, defaulting to an empty List<Results> if null.
    //       final newResults = data.results ?? <Results>[];
    //
    //       // 2. Combine the lists. Now 'updatedList' will be correctly inferred as List<Results>.
    //       final updatedList = [...currentState.actorsList, ...newResults];
    //
    //       emit(currentState.copyWith(actorsList: updatedList, currentPage: nextPage));
    //     } catch (e) {
    //       emit(ActorsListError(e.toString()));
    //     }
    //   });
    // }
  }
}
