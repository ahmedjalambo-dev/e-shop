import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_styles.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/features/auth/login/widgets/my_text_form_field.dart';
import 'package:eshop/features/auth/verify_email/cubit/verify_email_cubit.dart';
import 'package:eshop/features/auth/verify_email/ui/widgets/verify_email_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSapce(50),
                Text('Verify Your Email', style: MyStyles.font52w700black),
                verticalSapce(10),
                Text(
                  'Please enter the 6-digit code sent to\n$email',
                  style: MyStyles.font19w300Black,
                ),
                verticalSapce(30),
                Form(
                  key: context.read<VerifyEmailCubit>().formKey,
                  child: MyTextFormField(
                    controller: context.read<VerifyEmailCubit>().otpController,
                    hintText: 'Enter OTP',
                    validator: (otp) {
                      if (otp == null || otp.isEmpty) {
                        return 'Please enter the OTP';
                      }
                      if (otp.length != 6) {
                        return 'OTP must be 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSapce(40),
                MyTextButton(
                  text: 'Verify',
                  textStyle: MyStyles.font22w300LighterGrey,
                  onPressed: () {
                    validateAndSubmit(context);
                  },
                ),
                verticalSapce(20), // Add some space
                // Add the Resend OTP button
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      context.read<VerifyEmailCubit>().resendOtp();
                    },
                    child: Text(
                      'Didn\'t receive a code? Resend OTP',
                      style: MyStyles.font14w500Grey.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const VerifyEmailBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSubmit(BuildContext context) {
    if (context.read<VerifyEmailCubit>().formKey.currentState!.validate()) {
      context.read<VerifyEmailCubit>().emitVerifyEmailState();
    }
  }
}
