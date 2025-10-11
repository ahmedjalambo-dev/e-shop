import 'package:eshop/core/cache/shared_pref_keys.dart';
import 'package:eshop/core/di/injection.dart';
import 'package:eshop/core/helpers/shared_pref_helper.dart';
import 'package:eshop/core/routes/my_router.dart';
import 'package:eshop/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkIfLoggedInUser();
  runApp(MyApp(myRouter: MyRouter()));
}

Future<void> checkIfLoggedInUser() async {
  String userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  userToken.isNotEmpty ? isLoggedUser = true : isLoggedUser = false;
}
