import 'package:get_it/get_it.dart';
import '../../feature/actors_list/data/datasource/actors_list_datasource.dart';
import '../../feature/actors_list/data/repository/actors_list_repo.dart';
import '../../feature/actors_list/domain/repository/actors_list_repoo.dart';
import '../../feature/actors_list/domain/usecases/get_actors_list_usecase.dart';
import '../../feature/actors_list/presentation/blocs/actor_list_bloc.dart';
import '../network/dio_client.dart';
import '../network/api_constants.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio Client
  sl.registerLazySingleton(() => DioClient(ApiConstants.baseUrl, ApiConstants.apiKey));

  // Services
  sl.registerLazySingleton(() => ActorsListService(sl<DioClient>()));

  // Repository
  sl.registerLazySingleton<ActorRepository>(
        () => ActorsRepositoryImpl(sl<ActorsListService>()),
  );

  // UseCase
  sl.registerLazySingleton(() => GetPopularActorsUseCase(sl<ActorRepository>()));

  // Bloc
  sl.registerFactory(() => ActorsListBloc(sl<GetPopularActorsUseCase>()));
}
