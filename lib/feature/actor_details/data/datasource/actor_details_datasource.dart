import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/actor_details_model.dart';

class ActorDetailsService {
  final DioClient dioClient;

  ActorDetailsService(this.dioClient);

  Future<ActorDetailsModel> fetchActorDetails(int actorId) async {
    try {
      final response = await dioClient.get(
        ApiConstants.actorDetails(actorId),
        queryParameters: {'api_key': ApiConstants.apiKey},
      );
      /// parse the whole response
      return ActorDetailsModel.fromJson(response.data);

    } catch (e) {
      throw Exception('Failed to fetch actors: $e');
    }
  }

}