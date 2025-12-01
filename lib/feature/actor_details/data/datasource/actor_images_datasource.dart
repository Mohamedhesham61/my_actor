import 'package:my_actors/core/network/api_constants.dart';
import 'package:my_actors/core/network/dio_client.dart';
import '../models/actor_images_model.dart';

class ActorImagesService {
  final DioClient dioClient;

  ActorImagesService(this.dioClient);

  Future<ActorImagesModel> fetchActorImages(int actorId) async {
    try {
      final response = await dioClient.get(
        ApiConstants.actorImages(actorId),
        queryParameters: {'api_key': ApiConstants.apiKey},
      );
      return ActorImagesModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch actors: $e');
    }
  }
}
