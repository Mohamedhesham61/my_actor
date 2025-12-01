import '../../data/models/actor_details_model.dart';
import '../repository/actor_details_repo.dart';

class GetActorDetailsUseCase {
  final ActorDetailsRepository repository;

  GetActorDetailsUseCase(this.repository);

  Future<ActorDetailsModel> call(int actorId) async {
    return await repository.getActorDetails(actorId);
  }
}