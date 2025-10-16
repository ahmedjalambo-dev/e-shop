import 'package:eshop/core/cache/shared_pref_keys.dart';
import 'package:eshop/core/di/injection.dart';
import 'package:eshop/core/helpers/shared_pref_helper.dart';
import 'package:eshop/core/routes/my_router.dart';
import 'package:eshop/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  final userToken = await SharedPrefHelper.getString(SharedPrefKeys.accessToken);
  final bool isLoggedIn = userToken != null && userToken.isNotEmpty;
  runApp(MyApp(myRouter: MyRouter(), isLoggedIn: isLoggedIn));
}
