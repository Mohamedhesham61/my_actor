import 'package:flutter/material.dart';
import 'package:my_actors/core/routing/routes.dart';

import '../../feature/actor_details/presentation/screens/actor_details_imports.dart';
import '../../feature/actor_image/presentation/screens/actor_image_imports.dart';
import '../../feature/actors_list/presentation/screens/actors_list_imports.dart';
import '../../splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.actorListScreen:
        return MaterialPageRoute(builder: (_) => const ActorsListScreen());
      case Routes.actorDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final actorId = args['actorId'] as int;
        final actorName = args['actorName'] as String;
        return MaterialPageRoute(
          builder: (_) => ActorDetailsScreen(actorId: actorId, actorName: actorName),
        );
      case Routes.actorImageScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final imageUrl = args['imageUrl'] as String;
        return MaterialPageRoute(
          builder: (_) => ActorImageScreen(imageUrl: imageUrl),
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
