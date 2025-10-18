import 'package:dio/dio.dart';
import 'package:eshop/core/netowoks/api_constant.dart';
import 'package:eshop/features/home/data/models/products_request_body.dart';
import 'package:eshop/features/home/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'products_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ProductsService {
  factory ProductsService(Dio dio, {String baseUrl}) = _ProductsService;

  @GET(ApiConstant.products)
  Future<ProductsResponse> getProducts(
    @Body() ProductsRequestBody productsRequestBody,
  );
}
