import '../../data/models/actors_list_model.dart';

abstract class ActorRepository {
  Future<ActorsListModel> getPopularActors({int? pageNumber});
}
