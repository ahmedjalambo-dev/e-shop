import 'package:dio/dio.dart';
import 'package:eshop/features/forgot_password/data/models/forgot_password_request_body.dart';
import 'package:eshop/features/login/data/models/login_request_body.dart';
import 'package:eshop/features/login/data/models/login_response.dart';
import 'package:eshop/features/reset_password/data/models/reset_password_request_body.dart';
import 'package:eshop/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:eshop/features/sign_up/data/models/sign_up_response.dart';
import 'package:eshop/features/verify_email/data/models/resend_otp_request_body.dart';
import 'package:eshop/features/verify_email/data/models/verify_email_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:eshop/core/netowoks/api_constant.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstant.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);

  @POST(ApiConstant.verifyEmail)
  Future<String> verifyEmail(
    @Body() VerifyEmailRequestBody verifyEmailRequestBody,
  );

  @POST(ApiConstant.resendOtp)
  Future<String> resendOtp(@Body() ResendOtpRequestBody resendOtpRequestBody);

  @POST(ApiConstant.forgotPassword)
  Future<String> forgotPassword(
    @Body() ForgotPasswordRequestBody forgotPasswordRequestBody,
  );

  @POST(ApiConstant.resetPassword)
  Future<String> resetPassword(
    @Body() ResetPasswordRequestBody resetPasswordRequestBody,
  );
}
