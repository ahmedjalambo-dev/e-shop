import 'package:eshop/core/extentions/extentions.dart';
import 'package:eshop/core/helpers/validator_helper.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/features/auth/login/cubit/login_cubit.dart';
import 'package:eshop/core/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isObscureText = true;

  bool hasMinLength = false;
  bool hasUpperCaseLetter = false;
  bool hasLowerCaseLetter = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  @override
  void dispose() {
    passwordController.removeListener(_updatePasswordValidations);
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(_updatePasswordValidations);
  }

  void _updatePasswordValidations() {
    final password = passwordController.text;
    setState(() {
      hasMinLength = ValidatorHelper.validateMinLength(password, 8) == null;
      hasUpperCaseLetter =
          ValidatorHelper.validateHasUppercase(password) == null;
      hasLowerCaseLetter =
          ValidatorHelper.validateHasLowercase(password) == null;
      hasDigit = ValidatorHelper.validateHasDigit(password) == null;
      hasSpecialCharacter =
          ValidatorHelper.validateHasSpecialCharacter(password) == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          MyTextFormField(
            controller: emailController,
            hintText: 'Email',
            // 1. Cleaner Email Validation
            validator: (email) => ValidatorHelper.validateEmail(email),
          ),
          verticalSapce(10),
          MyTextFormField(
            controller: passwordController,
            hintText: 'Password',
            // 2. More Specific Password Validation
            validator: (password) => ValidatorHelper.validatePassword(password),
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => isObscureText = !isObscureText),
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSapce(10), // Add space
          // Add Forgot Password Button
          GestureDetector(
            onTap: () {
              context.pushNamed(MyRoutes.forgotPassword);
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: MyTextStyle.font14w400Grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
