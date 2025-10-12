import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/core/netowoks/api_service.dart';
import 'package:eshop/features/auth/reset_password/data/models/reset_password_request_body.dart';

class ResetPasswordRepo {
  final ApiService _apiService;

  ResetPasswordRepo(this._apiService);

  Future<ApiResult<String>> resetPassword(
    ResetPasswordRequestBody resetPasswordRequestBody,
  ) async {
    try {
      final response = await _apiService.resetPassword(
        resetPasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
