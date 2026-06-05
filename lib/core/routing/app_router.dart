import 'package:aurelia/core/routing/routes.dart';
import 'package:aurelia/features/auth/logic/cubit/register_cubit.dart';
import 'package:aurelia/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/logic/cubit/forgot_password_cubit.dart';
import '../../features/auth/logic/cubit/login_cubit.dart';
import '../../features/auth/logic/cubit/reset_password_cubit.dart';
import '../../features/auth/logic/cubit/verify_email_cubit.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/verify_email_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/profile/logic/cubit/profile_cubit.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<VerifyEmailCubit>(),
            child: VerifyEmailScreen(email: email),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: RegisterScreen(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProfileCubit>(),
            child: const ProfileScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );

      case Routes.resetPassword:
        final email = settings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ResetPasswordCubit>(),
            child: ResetPasswordScreen(email: email),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
