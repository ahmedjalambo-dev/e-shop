import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/login/cubit/login_state.dart';
import 'package:eshop/features/login/data/models/login_request_body.dart';
import 'package:eshop/features/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // For real-time password validation UI
  bool hasMinLength = false;
  bool hasUpperCaseLetter = false;
  bool hasLowerCaseLetter = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;

  void emitLoginStates() async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) => emit(LoginState.success(loginResponse)),
      failure: (error) =>
          emit(LoginState.failure(error.apiErrorModel.message ?? '')),
    );
  }
}
