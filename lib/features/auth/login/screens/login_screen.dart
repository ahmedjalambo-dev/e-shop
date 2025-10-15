import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/features/auth/login/cubit/login_cubit.dart';
import 'package:eshop/features/auth/login/widgets/do_not_have_account.dart';
import 'package:eshop/features/auth/login/widgets/login_form.dart';
import 'package:eshop/features/auth/login/widgets/login_bloc_listener.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSapce(100),
                Text(
                  'Login',
                  style: MyTextStyle.font52w700black,
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    Text(
                      'Good to see you back!',
                      style: MyTextStyle.font19w300Black,
                    ),
                    horizontalSapce(10),
                    SvgPicture.asset('assets/svgs/heart.svg', width: 16.w),
                  ],
                ),
                verticalSapce(20),
                const LoginForm(),
                verticalSapce(30),
                MyTextButton(
                  text: 'Next',
                  textStyle: MyTextStyle.font14w500White,
                  onPressed: () {
                    ValidationThenLogin(context);
                  },
                ),
                verticalSapce(30),
                DoNotHaveAccount(),
                LoginBlocListener(),
              ],
            ),
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
