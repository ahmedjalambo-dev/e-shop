import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:flutter/material.dart';

import 'package:eshop/core/routes/my_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final MyRouter myRouter;
  const MyApp({super.key, required this.myRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eshop app',
        theme: ThemeData(
          primaryColor: MyColor.myBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: myRouter.generateRoute,
        initialRoute: MyRoutes.onboarding,
      ),
    );
  }
}
