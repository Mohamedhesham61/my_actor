import 'package:equatable/equatable.dart';
import '../../data/models/actors_list_model.dart';

abstract class ActorsListState extends Equatable {
  const ActorsListState();

  @override
  List<Object?> get props => [];
}

class ActorsListInitial extends ActorsListState {}

class ActorsListLoading extends ActorsListState {}

class ActorsListLoaded extends ActorsListState {
  final List<Results> actorsList;
  final int currentPage;
  final int totalPages;
  final bool isLoadingMore;

  const ActorsListLoaded({
    required this.actorsList,
    required this.currentPage,
    required this.totalPages,
    this.isLoadingMore = false,
  });

  ActorsListLoaded copyWith({
    List<Results>? actorsList,
    int? currentPage,
    int? totalPages,
    bool? isLoadingMore,
  }) {
    return ActorsListLoaded(
      actorsList: actorsList ?? this.actorsList,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

// @override
// List<Object?> get props => [actorsList, currentPage, totalPages];
// }

class ActorsListError extends ActorsListState {
  final String message;

  const ActorsListError(this.message);

  @override
  List<Object?> get props => [message];
}
