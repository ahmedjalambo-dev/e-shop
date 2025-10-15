import 'package:eshop/core/cache/shared_pref_keys.dart';
import 'package:eshop/core/helpers/shared_pref_helper.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/core/netowoks/dio_factory.dart';
import 'package:eshop/features/auth/login/cubit/login_state.dart';
import 'package:eshop/features/auth/login/data/models/login_request_body.dart';
import 'package:eshop/features/auth/login/data/models/login_response.dart';
import 'package:eshop/features/auth/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserTokens(loginResponse);
        emit(LoginState.success(loginResponse));
      },
      failure: (error) =>
          emit(LoginState.failure(error.apiErrorModel.message ?? '')),
    );
  }

  Future<void> saveUserTokens(LoginResponse loginResponse) async {
    await SharedPrefHelper.setData(
      SharedPrefKeys.accessToken,
      loginResponse.accessToken,
    );
    await SharedPrefHelper.setData(
      SharedPrefKeys.refreshToken,
      loginResponse.refreshToken,
    );
    DioFactory.setTokenIntoHeader(loginResponse.accessToken);
  }
}
