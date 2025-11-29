import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_actors/feature/actors_list/presentation/screens/actor_list_screen.dart';
import 'core/di/dependency_injection.dart';
import 'feature/actors_list/presentation/blocs/actor_list_bloc.dart';
import 'feature/actors_list/presentation/blocs/actor_list_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator
  await init();

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<ActorsListBloc>()..add(FetchActorsList()),
            ),
          ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ActorListScreen(),
    );
  }
}
