import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:eshop/features/auth/sign_up/ui/widgets/already_have_account.dart';
import 'package:eshop/features/auth/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:eshop/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSapce(100),
              Text(
                'Create Account',
                style: MyTextStyle.font52w700black.copyWith(height: 1),
              ),
              verticalSapce(20),
              const SignupForm(),
              verticalSapce(30),
              MyTextButton(
                text: 'Done',
                textStyle: MyTextStyle.font14w500White,
                onPressed: () {
                  ValidationThenSignUp(context);
                },
              ),
              verticalSapce(30),
              AlreadyHaveAccount(),
              SignUpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void ValidationThenSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignupStates();
    }
  }
}
