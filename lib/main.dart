import 'package:eshop/core/cache/shared_pref_keys.dart';
import 'package:eshop/core/di/injection.dart';
import 'package:eshop/core/helpers/shared_pref_helper.dart';
import 'package:eshop/core/routes/my_router.dart';
import 'package:eshop/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();

  // 1. Get the token directly here
  final userToken = await SharedPrefHelper.getString(SharedPrefKeys.accessToken);
  final bool isLoggedIn = userToken != null && userToken.isNotEmpty;

  // 2. Pass the result into MyApp's constructor
  runApp(MyApp(myRouter: MyRouter(), isLoggedIn: isLoggedIn));
}
