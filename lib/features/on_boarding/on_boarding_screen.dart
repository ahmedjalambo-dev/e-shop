import 'package:eshop/core/extentions/extentions.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  SvgPicture.asset('assets/svgs/logo.svg', width: 22.w),
                  horizontalSapce(5),
                  Text(
                    'eShop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: MyColor.myGrey,
                    ),
                  ),
                ],
              ),
              verticalSapce(32),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.0, 0.25],
                        colors: [Colors.white, Colors.white.withAlpha(0)],
                      ),
                    ),
                    child: Image.asset('assets/images/onboarding.png'),
                  ),
                  Positioned(
                    bottom: -30.h,
                    left: 0,
                    right: 0,
                    child: Text(
                      'Be the first to wear it.',
                      style: MyTextStyle.font28w800Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              verticalSapce(46),
              Text(
                'We\'re constantly dropping fresh, curated styles just for you. Never miss a drop. New collections, limited editions, and exclusive finds are always arriving.',
                style: MyTextStyle.font14w400Grey,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              MyTextButton(
                text: 'Get Started',
                textStyle: MyTextStyle.font14w500White,
                onPressed: () => context.pushReplacementNamed(MyRoutes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
