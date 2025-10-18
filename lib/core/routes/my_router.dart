import 'package:eshop/core/di/injection.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:eshop/features/auth/forgot_password/ui/screens/forgot_password_screen.dart';
import 'package:eshop/features/auth/login/cubit/login_cubit.dart';
import 'package:eshop/features/auth/login/screens/login_screen.dart';
import 'package:eshop/features/home/ui/screens/brand_screen.dart';
import 'package:eshop/features/on_boarding/on_boarding_screen.dart';
import 'package:eshop/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:eshop/features/auth/reset_password/ui/screens/reset_password_screen.dart';
import 'package:eshop/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:eshop/features/auth/sign_up/ui/screens/sign_up_screen.dart';
import 'package:eshop/features/auth/verify_email/cubit/verify_email_cubit.dart';
import 'package:eshop/features/auth/verify_email/ui/screens/verify_email_screen.dart';
import 'package:eshop/features/shop/ui/screens/shop_screen.dart';
import 'package:eshop/my_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.onboarding:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
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
      case MyRoutes.root:
        return MaterialPageRoute(builder: (_) => MyRoot());
      case MyRoutes.brand:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BrandScreen(category: category),
        );
      case MyRoutes.shop:
        return MaterialPageRoute(builder: (_) => ShopScreen());

      default:
        return null;
    }
  }
}
