import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/core/netowoks/api_service.dart';
import 'package:eshop/features/verify_email/data/models/resend_otp_request_body.dart';
import 'package:eshop/features/verify_email/data/models/verify_email_request_body.dart';
import 'package:eshop/features/verify_email/data/models/verify_email_response.dart';

class VerifyEmailRepo {
  final ApiService _apiService;

  VerifyEmailRepo(this._apiService);

  Future<ApiResult<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequestBody verifyEmailRequestBody,
  ) async {
    try {
      // This will now return the plain text string from the server
      final responseMessage = await _apiService.verifyEmail(
        verifyEmailRequestBody,
      );

      // Manually create the success object with the message
      return ApiResult.success(VerifyEmailResponse(message: responseMessage));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String>> resendOtp(String email) async {
    try {
      final response = await _apiService.resendOtp(
        ResendOtpRequestBody(email: email),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
