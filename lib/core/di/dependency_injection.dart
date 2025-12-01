import 'package:get_it/get_it.dart';
import '../../feature/actor_details/data/datasource/actor_details_datasource.dart';
import '../../feature/actor_details/data/datasource/actor_images_datasource.dart';
import '../../feature/actor_details/data/repository/actor_details_repo_impl.dart';
import '../../feature/actor_details/data/repository/actor_images_repo_impl.dart';
import '../../feature/actor_details/domain/repository/actor_details_repo.dart';
import '../../feature/actor_details/domain/repository/actor_images_repo.dart';
import '../../feature/actor_details/domain/usecases/actor_details_usecase.dart';
import '../../feature/actor_details/domain/usecases/actor_images_usecase.dart';
import '../../feature/actor_details/presentation/controllers/actor_details_bloc.dart';
import '../../feature/actor_details/presentation/controllers/actor_images_bloc.dart';
import '../../feature/actors_list/data/datasource/actors_list_datasource.dart';
import '../../feature/actors_list/data/repository/actors_list_repo_impl.dart';
import '../../feature/actors_list/domain/repository/actors_list_repo.dart';
import '../../feature/actors_list/domain/usecases/get_actors_list_usecase.dart';
import '../../feature/actors_list/presentation/blocs/actors_list_bloc.dart';
import '../network/dio_client.dart';
import '../network/api_constants.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio Client
  sl.registerLazySingleton(() => DioClient(ApiConstants.baseUrl, ApiConstants.apiKey));

  // Services
  sl.registerLazySingleton(() => ActorsListService(sl<DioClient>()));
  sl.registerLazySingleton(() => ActorDetailsService(sl<DioClient>()));
  sl.registerLazySingleton(() => ActorImagesService(sl<DioClient>()));

  // Repository
  sl.registerLazySingleton<ActorRepository>(() => ActorsRepositoryImpl(sl<ActorsListService>()));
  sl.registerLazySingleton<ActorDetailsRepository>(() => ActorDetailsRepositoryImpl(sl<ActorDetailsService>()));
  sl.registerLazySingleton<ActorImagesRepository>(() => ActorImagesRepositoryImpl(sl<ActorImagesService>()));

  // UseCase
  sl.registerLazySingleton(() => GetPopularActorsUseCase(sl<ActorRepository>()));
  sl.registerLazySingleton(() => GetActorDetailsUseCase(sl<ActorDetailsRepository>()));
  sl.registerLazySingleton(() => GetActorImagesUseCase(sl<ActorImagesRepository>()));

  // Bloc
  sl.registerFactory(() => ActorsListBloc(sl<GetPopularActorsUseCase>()));
  sl.registerFactory(() => ActorDetailsBloc(sl<GetActorDetailsUseCase>()));
  sl.registerFactory(() => ActorImagesBloc(sl<GetActorImagesUseCase>()));
}
