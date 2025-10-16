import 'package:dio/dio.dart';
import 'package:eshop/core/netowoks/api_service.dart';
import 'package:eshop/core/netowoks/dio_factory.dart';
import 'package:eshop/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:eshop/features/auth/forgot_password/data/repos/forgot_password_repo.dart';
import 'package:eshop/features/auth/login/cubit/login_cubit.dart';
import 'package:eshop/features/auth/login/data/repos/login_repo.dart';
import 'package:eshop/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:eshop/features/auth/reset_password/data/repos/reset_password_repo.dart';
import 'package:eshop/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:eshop/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:eshop/features/auth/verify_email/cubit/verify_email_cubit.dart';
import 'package:eshop/features/auth/verify_email/data/repos/verify_email_repo.dart';
import 'package:eshop/features/shop/data/repos/categories_repo.dart';
import 'package:eshop/features/shop/data/services/categories_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton(() => LoginRepo(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));

  // signUp
  getIt.registerLazySingleton(() => SignUpRepo(getIt()));
  getIt.registerFactory(() => SignUpCubit(getIt()));

  // verify email
  getIt.registerLazySingleton(() => VerifyEmailRepo(getIt()));
  getIt.registerFactoryParam<VerifyEmailCubit, String, void>(
    (email, _) => VerifyEmailCubit(getIt(), email),
  );

  // forgot password
  getIt.registerLazySingleton(() => ForgotPasswordRepo(getIt()));
  getIt.registerFactory(() => ForgotPasswordCubit(getIt()));

  // reset password
  getIt.registerLazySingleton(() => ResetPasswordRepo(getIt()));
  getIt.registerFactoryParam<ResetPasswordCubit, String, void>(
    (email, _) => ResetPasswordCubit(getIt(), email),
  );

  // shop
  getIt.registerLazySingleton<CategoriesService>(() => CategoriesService(dio));
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(getIt()));
  // getIt.registerFactory(() => CategoriesCubit(getIt()));
}
