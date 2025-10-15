import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/my_root.dart';
import 'package:flutter/material.dart';

import 'package:eshop/core/routes/my_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final MyRouter myRouter;
  final bool isLoggedIn;

  const MyApp({super.key, required this.myRouter, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eshop app',
        theme: ThemeData(
          fontFamily: 'SF-Pro',
          colorScheme: ColorScheme.fromSeed(
            seedColor: MyColor.myBlack,
          ).copyWith(primary: MyColor.myBlack, secondary: MyColor.myGrey),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        onGenerateRoute: myRouter.generateRoute,
        initialRoute: isLoggedIn ? MyRoutes.root : MyRoutes.onboarding,
        routes: {MyRoutes.root: (context) => MyRoot()},
      ),
    );
  }
}
