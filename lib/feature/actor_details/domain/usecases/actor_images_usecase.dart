
import '../../data/models/actor_images_model.dart';
import '../repository/actor_images_repo.dart';

class GetActorImagesUseCase {
  final ActorImagesRepository repository;

  GetActorImagesUseCase(this.repository);

  Future<ActorImagesModel> call(int actorId) async{
    return await repository.getActorImages(actorId);
  }

}