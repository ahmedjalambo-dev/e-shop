import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/auth/verify_email/cubit/verify_email_state.dart';
import 'package:eshop/features/auth/verify_email/data/models/verify_email_request_body.dart';
import 'package:eshop/features/auth/verify_email/data/repos/verify_email_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailRepo _verifyEmailRepo;
  final String email; // Email passed from the signup screen

  VerifyEmailCubit(this._verifyEmailRepo, this.email)
    : super(const VerifyEmailState.initial());

  TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitVerifyEmailState() async {
    emit(const VerifyEmailState.loading());
    final response = await _verifyEmailRepo.verifyEmail(
      VerifyEmailRequestBody(email: email, otp: otpController.text),
    );

    response.when(
      success: (verifyEmailResponse) =>
          emit(VerifyEmailState.success(verifyEmailResponse)),
      failure: (error) =>
          emit(VerifyEmailState.failure(error.apiErrorModel.message ?? '')),
    );
  }

  void resendOtp() async {
    // This is a background action, so we don't emit a loading state.
    // Feedback will be handled by the listener showing a SnackBar.
    final response = await _verifyEmailRepo.resendOtp(email);
    response.when(
      success: (successMessage) {
        emit(VerifyEmailState.resendOtpSuccess(successMessage));
      },
      failure: (error) {
        emit(
          VerifyEmailState.resendOtpFailure(
            error.apiErrorModel.message ?? 'Failed to resend OTP',
          ),
        );
      },
    );
  }
}
