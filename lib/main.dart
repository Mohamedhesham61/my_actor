import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/theme_manager.dart';
import 'feature/actor_details/presentation/controllers/actor_details_bloc.dart';
import 'feature/actor_details/presentation/controllers/actor_details_event.dart';
import 'feature/actor_details/presentation/controllers/actor_images_bloc.dart';
import 'feature/actors_list/presentation/blocs/actors_list_bloc.dart';
import 'feature/actors_list/presentation/blocs/actors_list_event.dart';
import 'feature/no_internet/presenatation/bloc/no_internet_bloc.dart';
import 'feature/no_internet/presenatation/bloc/no_internet_state.dart';
import 'feature/no_internet/presenatation/screens/no_internet_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ActorsListBloc>()..add(FetchActorsList())),
        BlocProvider(create: (context) => sl<ActorDetailsBloc>()),
        BlocProvider(create: (context) => sl<ActorImagesBloc>()),
        BlocProvider(create: (context) => sl<ConnectivityBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemes(),
        initialRoute: '/splashScreen',
        onGenerateRoute: AppRouter.generateRoute,
        builder: (context, child) {
          return BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, state) {
              final isSplash = ModalRoute.of(context)?.settings.name == Routes.splashScreen;
              if (state is ConnectivityOffline && !isSplash) {
                return Stack(
                  children: [
                    child!,
                    const NoInternetScreen(),
                  ],
                );
              }
              return child!;
            },
          );
        },
      ),
    );
  }
}
