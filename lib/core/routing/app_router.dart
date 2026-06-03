import 'package:aurelia/core/routing/routes.dart';
import 'package:aurelia/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/logic/cubit/login_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginScreen(),
              ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
          const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
