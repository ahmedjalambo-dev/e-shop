import 'package:dio/dio.dart';
import 'package:eshop/features/login/data/models/login_request_body.dart';
import 'package:eshop/features/login/data/models/login_response.dart';
import 'package:eshop/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:eshop/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:eshop/core/netowoks/api_constant.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstant.signup)
  Future<SignUpResponse> signup(@Body() SignUpRequestBody signupRequestBody);
}
