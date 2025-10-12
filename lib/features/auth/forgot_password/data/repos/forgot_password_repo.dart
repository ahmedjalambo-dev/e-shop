import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/core/netowoks/api_service.dart';
import 'package:eshop/features/auth/forgot_password/data/models/forgot_password_request_body.dart';

class ForgotPasswordRepo {
  final ApiService _apiService;

  ForgotPasswordRepo(this._apiService);

  Future<ApiResult<String>> forgotPassword(String email) async {
    try {
      final response = await _apiService.forgotPassword(
        ForgotPasswordRequestBody(email: email),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
