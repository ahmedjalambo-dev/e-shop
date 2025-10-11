import 'package:eshop/core/helpers/validator_helper.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/sign_up/cubit/sign_up_state.dart';
import 'package:eshop/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:eshop/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  // For real-time password validation UI
  bool hasMinLength = false;
  bool hasUpperCaseLetter = false;
  bool hasLowerCaseLetter = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;

  void updatePasswordValidations(String password) {
    hasMinLength = ValidatorHelper.validateMinLength(password, 8) == null;
    hasUpperCaseLetter = ValidatorHelper.validateHasUppercase(password) == null;
    hasLowerCaseLetter = ValidatorHelper.validateHasLowercase(password) == null;
    hasDigit = ValidatorHelper.validateHasDigit(password) == null;
    hasSpecialCharacter =
        ValidatorHelper.validateHasSpecialCharacter(password) == null;
  }

  void emitSignupStates() async {
    emit(SignUpState.loading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        LastName: lastNameController.text,
      ),
    );
    response.when(
      success: (SignUpResponse) => emit(SignUpState.success(SignUpResponse)),
      failure: (error) =>
          emit(SignUpState.failure(error.apiErrorModel.message ?? '')),
    );
  }
}
