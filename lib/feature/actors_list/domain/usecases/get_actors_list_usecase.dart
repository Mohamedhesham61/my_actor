import '../../data/models/actors_list_model.dart';
import '../repository/actors_list_repoo.dart';

class GetPopularActorsUseCase {
  final ActorRepository repository;

  GetPopularActorsUseCase(this.repository);

  Future<ActorsListModel> call({int? page}) async {
    return await repository.getPopularActors(page: page);
  }
}
