import 'package:dio/dio.dart';
import 'package:eshop/core/netowoks/api_constant.dart';
import 'package:eshop/features/home/data/models/categories_response.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CategoriesService {
  factory CategoriesService(Dio dio, {String baseUrl}) = _CategoriesService;

  @GET(ApiConstant.categories)
  Future<CategoriesResponse> getCategories();
}
