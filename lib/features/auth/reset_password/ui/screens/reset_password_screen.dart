import 'package:eshop/core/helpers/validator_helper.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/core/widgets/my_text_form_field.dart';
import 'package:eshop/features/auth/login/widgets/password_validations.dart';
import 'package:eshop/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:eshop/features/auth/reset_password/ui/widgets/reset_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final ResetPasswordCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ResetPasswordCubit>();
    _cubit.newPasswordController.addListener(() {
      setState(() {
        _cubit.updatePasswordValidations(_cubit.newPasswordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSapce(50),
                  Text(
                    'Enter the OTP and your new password.',
                    style: MyTextStyle.font19w300Black,
                  ),
                  verticalSapce(30),
                  MyTextFormField(
                    controller: _cubit.otpController,
                    hintText: 'OTP',
                    validator: (otp) {
                      if (otp == null || otp.isEmpty) return 'OTP is required';
                      return null;
                    },
                  ),
                  verticalSapce(20),
                  MyTextFormField(
                    controller: _cubit.newPasswordController,
                    hintText: 'New Password',
                    validator: (password) =>
                        ValidatorHelper.validatePassword(password),
                  ),
                  verticalSapce(20),
                  PasswordValidations(
                    hasMinLength: _cubit.hasMinLength,
                    hasUpperCaseLetter: _cubit.hasUpperCaseLetter,
                    hasLowerCaseLetter: _cubit.hasLowerCaseLetter,
                    hasDigit: _cubit.hasDigit,
                    hasSpecialCharacter: _cubit.hasSpecialCharacter,
                  ),

                  verticalSapce(40),
                  MyTextButton(
                    text: 'Reset Password',
                    textStyle: MyTextStyle.font22w300LighterGrey,
                    onPressed: () => validateAndSubmit(context),
                  ),
                  const ResetPasswordBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSubmit(BuildContext context) {
    if (_cubit.formKey.currentState!.validate()) {
      _cubit.emitResetPasswordState();
    }
  }

  @override
  void dispose() {
    _cubit.newPasswordController.removeListener(() {});
    super.dispose();
  }
}
