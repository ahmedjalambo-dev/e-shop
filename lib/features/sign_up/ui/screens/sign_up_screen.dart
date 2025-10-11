import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_styles.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/features/login/widgets/password_validations.dart';
import 'package:eshop/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:eshop/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:eshop/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    late final SignUpCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignUpCubit>();
    _cubit.passwordController.addListener(() {
      setState(() {
        _cubit.updatePasswordValidations(_cubit.passwordController.text);
      });
    });
  }
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
              Text('Create\nAccount', style: MyStyles.font52w700black),
              verticalSapce(17),
              const SignupForm(),
              verticalSapce(10),
              PasswordValidations(
                hasMinLength: context.watch<SignUpCubit>().hasMinLength,
                hasUpperCaseLetter: context
                    .watch<SignUpCubit>()
                    .hasUpperCaseLetter,
                hasLowerCaseLetter: context
                    .watch<SignUpCubit>()
                    .hasLowerCaseLetter,
                hasDigit: context.watch<SignUpCubit>().hasDigit,
                hasSpecialCharacter: context
                    .watch<SignUpCubit>()
                    .hasSpecialCharacter,
              ),
              verticalSapce(37),
              MyTextButton(
                text: 'Done',
                textStyle: MyStyles.font22w300LighterGrey,
                onPressed: () {
                  ValidationThenSignUp(context);
                },
              ),
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
