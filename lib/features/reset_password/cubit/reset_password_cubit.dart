import 'package:eshop/core/helpers/my_validator.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/reset_password/cubit/reset_password_state.dart';
import 'package:eshop/features/reset_password/data/models/reset_password_request_body.dart';
import 'package:eshop/features/reset_password/data/repos/reset_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;
  final String email;

  ResetPasswordCubit(this._resetPasswordRepo, this.email)
    : super(const ResetPasswordState.initial());

  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();

  // For real-time password validation UI
  bool hasMinLength = false;
  bool hasUpperCaseLetter = false;
  bool hasLowerCaseLetter = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;

  void updatePasswordValidations(String password) {
    hasMinLength = MyValidator.validateMinLength(password, 8) == null;
    hasUpperCaseLetter = MyValidator.validateHasUppercase(password) == null;
    hasLowerCaseLetter = MyValidator.validateHasLowercase(password) == null;
    hasDigit = MyValidator.validateHasDigit(password) == null;
    hasSpecialCharacter =
        MyValidator.validateHasSpecialCharacter(password) == null;
    // Emit a state to rebuild the UI, or handle this within a StatefulWidget's setState
  }

  void emitResetPasswordState() async {
    emit(const ResetPasswordState.loading());
    final response = await _resetPasswordRepo.resetPassword(
      ResetPasswordRequestBody(
        email: email,
        otp: otpController.text,
        newPassword: newPasswordController.text,
      ),
    );

    response.when(
      success: (successMessage) {
        emit(ResetPasswordState.success(successMessage));
      },
      failure: (error) {
        emit(
          ResetPasswordState.failure(
            error.apiErrorModel.message ?? 'An error occurred',
          ),
        );
      },
    );
  }
}
