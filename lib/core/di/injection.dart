import 'package:dio/dio.dart';
import 'package:eshop/core/netowoks/api_service.dart';
import 'package:eshop/core/netowoks/dio_factory.dart';
import 'package:eshop/features/login/cubit/login_cubit.dart';
import 'package:eshop/features/login/data/repos/login_repo.dart';
import 'package:eshop/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:eshop/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory(() => LoginCubit(getIt<LoginRepo>()));

  // signup
  getIt.registerLazySingleton(() => SignUpRepo(getIt<ApiService>()));
  getIt.registerFactory(() => SignUpCubit(getIt<SignUpRepo>()));
}
