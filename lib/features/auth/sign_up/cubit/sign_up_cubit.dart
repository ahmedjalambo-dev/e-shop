import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/auth/sign_up/cubit/sign_up_state.dart';
import 'package:eshop/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:eshop/features/auth/sign_up/data/repos/sign_up_repo.dart';
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
