import '../../data/models/actor_details_model.dart';

abstract class ActorDetailsRepository {
  Future<ActorDetailsModel> getActorDetails(int actorId);
}