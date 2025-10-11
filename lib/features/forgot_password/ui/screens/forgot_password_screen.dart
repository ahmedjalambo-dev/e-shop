import 'package:eshop/core/helpers/validator_helper.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_styles.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/features/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:eshop/features/forgot_password/ui/widgets/forgot_password_bloc_listener.dart';
import 'package:eshop/features/login/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSapce(50),
              Text(
                'Enter your email to receive a password reset link.',
                style: MyStyles.font19w300Black,
              ),
              verticalSapce(30),
              Form(
                key: context.read<ForgotPasswordCubit>().formKey,
                child: MyTextFormField(
                  controller: context
                      .read<ForgotPasswordCubit>()
                      .emailController,
                  hintText: 'Email Address',
                  validator: (email) => ValidatorHelper.validateEmail(email),
                ),
              ),
              verticalSapce(40),
              MyTextButton(
                text: 'Send OTP',
                textStyle: MyStyles.font22w300LighterGrey,
                onPressed: () {
                  validateAndSubmit(context);
                },
              ),
              const ForgotPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndSubmit(BuildContext context) {
    if (context.read<ForgotPasswordCubit>().formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().emitForgotPasswordState();
    }
  }
}
