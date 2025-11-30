import 'package:flutter/material.dart';
import 'package:my_actors/core/routing/routes.dart';

import '../../feature/actors_list/presentation/screens/actor_list_screen.dart';
import '../../splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.actorListScreen:
        return MaterialPageRoute(builder: (_) => const ActorListScreen());
      // case Routes.actorDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ActorDetailsScreen(),
      //   );
      // case Routes.actorImageScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ActorImageScreen(),
      //   );
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
