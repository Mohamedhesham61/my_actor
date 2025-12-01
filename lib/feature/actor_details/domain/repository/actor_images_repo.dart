import '../../data/models/actor_images_model.dart';

abstract class ActorImagesRepository {
  Future<ActorImagesModel> getActorImages(int actorId);
}