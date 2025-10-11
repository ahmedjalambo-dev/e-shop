import 'package:eshop/core/extentions/extentions.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/core/themes/my_styles.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 21.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black12,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SvgPicture.asset('assets/svgs/logo.svg'),
              ),
              verticalSapce(24),
              Text('E-Shop', style: MyStyles.font52w700black),
              verticalSapce(18),
              Text(
                'Shop smarter, not harder—everything you need is right here.',
                style: MyStyles.font19w300Black,
                textAlign: TextAlign.center,
              ),
              verticalSapce(106),
              MyTextButton(
                text: 'Let\'s get started',
                textStyle: MyStyles.font22w300LighterGrey,
                onPressed: () => context.pushReplacementNamed(MyRoutes.signUp),
              ),
              verticalSapce(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Text(
                    'I already have an account',
                    style: MyStyles.font15w300Black,
                  ),
                  GestureDetector(
                    onTap: () => context.pushReplacementNamed(MyRoutes.login),
                    child: SvgPicture.asset('assets/svgs/arrow.svg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
