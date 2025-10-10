import 'package:eshop/core/helpers/spaceing.dart';
import 'package:eshop/core/themes/my_styles.dart';
import 'package:eshop/features/login/cubit/login_cubit.dart';
import 'package:eshop/features/login/widgets/login_form.dart';
import 'package:eshop/features/login/widgets/login_bloc_listener.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/features/login/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Bubbles.png"),
            fit: BoxFit.contain,
            alignment: AlignmentDirectional.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSapce(200),
              Text('Login', style: MyStyles.font52w700black),
              Row(
                children: [
                  Text(
                    'Good to see you back!',
                    style: MyStyles.font19w300Black,
                  ),
                  horizontalSapce(10),
                  SvgPicture.asset('assets/svgs/heart.svg', width: 16.w),
                ],
              ),
              verticalSapce(17),
              const LoginForm(),
              verticalSapce(10),
              PasswordValidations(
                hasMinLength: context.watch<LoginCubit>().hasMinLength,
                hasUpperCaseLetter: context
                    .watch<LoginCubit>()
                    .hasUpperCaseLetter,
                hasLowerCaseLetter: context
                    .watch<LoginCubit>()
                    .hasLowerCaseLetter,
                hasDigit: context.watch<LoginCubit>().hasDigit,
                hasSpecialCharacter: context
                    .watch<LoginCubit>()
                    .hasSpecialCharacter,
              ),
              verticalSapce(37),
              MyTextButton(
                text: 'Next',
                textStyle: MyStyles.font22w300LighterGrey,
                onPressed: () {
                  ValidationThenLogin(context);
                },
              ),

              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void ValidationThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
