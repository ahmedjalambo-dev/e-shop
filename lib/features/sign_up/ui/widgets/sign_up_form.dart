import 'package:eshop/core/helpers/validator_helper.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/features/login/widgets/my_text_form_field.dart';
import 'package:eshop/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  bool isObscureText = true;

  // Booleans for the real-time password validation UI
  bool hasMinLength = false;
  bool hasUpperCaseLetter = false;
  bool hasLowerCaseLetter = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;

  @override
  void initState() {
    super.initState();
    emailController = context.read<SignUpCubit>().emailController;
    passwordController = context.read<SignUpCubit>().passwordController;
    firstNameController = context.read<SignUpCubit>().firstNameController;
    lastNameController = context.read<SignUpCubit>().lastNameController;
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
      // Use the MyValidator methods, checking for null to get a boolean.
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
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          MyTextFormField(
            controller: firstNameController,
            hintText: 'First Name',
            // Cleaner name validation
            validator: (firstName) =>
                ValidatorHelper.validateName(firstName, 'First name'),
          ),
          verticalSapce(10),
          MyTextFormField(
            controller: lastNameController,
            hintText: 'Last Name',
            // Reusable name validation
            validator: (lastName) =>
                ValidatorHelper.validateName(lastName, 'Last name'),
          ),
          verticalSapce(10),
          MyTextFormField(
            controller: emailController,
            hintText: 'Email',
            // Cleaner email validation
            validator: (email) => ValidatorHelper.validateEmail(email),
          ),
          verticalSapce(10),
          MyTextFormField(
            controller: passwordController,
            hintText: 'Password',
            // More specific password validation
            validator: (password) => ValidatorHelper.validatePassword(password),
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => isObscureText = !isObscureText),
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
