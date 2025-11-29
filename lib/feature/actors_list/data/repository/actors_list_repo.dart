import '../../domain/repository/actors_list_repoo.dart';
import '../datasource/actors_list_datasource.dart';
import '../models/actors_list_model.dart';



class ActorsRepositoryImpl implements ActorRepository {
  final ActorsListService service;

  ActorsRepositoryImpl(this.service);

  @override
  Future<ActorsListModel> getPopularActors({int? page}) async {
    final json = await service.fetchPopularActors(page ?? 1);
    return json;
  }
}

