import '../../data/models/actors_list_model.dart';
import '../repository/actors_list_repo.dart';

class GetPopularActorsUseCase {
  final ActorRepository repository;

  GetPopularActorsUseCase(this.repository);

  Future<ActorsListModel> call({int? pageNumber}) async {
    return await repository.getPopularActors(pageNumber: pageNumber);
  }
}
