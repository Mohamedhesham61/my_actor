import '../../domain/repository/actors_list_repo.dart';
import '../datasource/actors_list_datasource.dart';
import '../models/actors_list_model.dart';

class ActorsRepositoryImpl implements ActorRepository {
  final ActorsListService service;

  ActorsRepositoryImpl(this.service);

  @override
  Future<ActorsListModel> getPopularActors({int? pageNumber}) async {
    final json = await service.fetchPopularActors(pageNumber ?? 1);
    return json;
  }
}

