import '../../domain/repository/actor_images_repo.dart';
import '../datasource/actor_images_datasource.dart';
import '../models/actor_images_model.dart';

class ActorImagesRepositoryImpl implements ActorImagesRepository{
  final ActorImagesService service;

  ActorImagesRepositoryImpl(this.service);

  Future<ActorImagesModel> getActorImages(int actorId) async{
    final json = service.fetchActorImages(actorId);
    return json;
  }

}