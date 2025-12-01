import '../../domain/repository/actor_details_repo.dart';
import '../datasource/actor_details_datasource.dart';
import '../models/actor_details_model.dart';

class ActorDetailsRepositoryImpl implements ActorDetailsRepository {
  final ActorDetailsService service;

  ActorDetailsRepositoryImpl(this.service);

  @override
  Future<ActorDetailsModel> getActorDetails(int actorId) async {
    final json = await service.fetchActorDetails(actorId);
    return json;
  }
}