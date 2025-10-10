import 'package:eshop/core/di/injection.dart';
import 'package:eshop/core/routes/my_router.dart';
import 'package:eshop/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(MyApp(myRouter: MyRouter()));
}
