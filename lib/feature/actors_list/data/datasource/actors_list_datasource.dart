import 'dart:developer';

import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/actors_list_model.dart';

class ActorsListService {
  final DioClient dioClient;

  ActorsListService(this.dioClient);

  Future<ActorsListModel> fetchPopularActors(int pageNumber) async {
    try {
      final response = await dioClient.get(
        ApiConstants.actorsList,
        queryParameters: {'api_key': ApiConstants.apiKey, 'page': pageNumber},
      );

      /// parse the whole response
      return ActorsListModel.fromJson(response.data);

    } catch (e) {
      log('errorr===> $e');
      throw Exception('Failed to fetch actors: $e');
    }
  }

}
