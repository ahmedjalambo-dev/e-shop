import 'package:eshop/core/di/injection.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/features/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:eshop/features/forgot_password/ui/screens/forgot_password_screen.dart';
import 'package:eshop/features/home/ui/screens/home_screen.dart';
import 'package:eshop/features/login/cubit/login_cubit.dart';
import 'package:eshop/features/login/screens/login_screen.dart';
import 'package:eshop/features/onboarding/onboarding_screen.dart';
import 'package:eshop/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:eshop/features/reset_password/ui/screens/reset_password_screen.dart';
import 'package:eshop/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:eshop/features/sign_up/ui/screens/sign_up_screen.dart';
import 'package:eshop/features/verify_email/cubit/verify_email_cubit.dart';
import 'package:eshop/features/verify_email/ui/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case MyRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );
      case MyRoutes.verify_email:
        final email = settings.arguments as String; // Receive email
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<VerifyEmailCubit>(param1: email),
            child: VerifyEmailScreen(email: email),
          ),
        );
      case MyRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case MyRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case MyRoutes.resetPassword:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(param1: email),
            child: const ResetPasswordScreen(),
          ),
        );
      case MyRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
