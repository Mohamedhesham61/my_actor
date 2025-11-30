import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/themes/theme_manager.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemes(),
        initialRoute: '/splashScreen',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
