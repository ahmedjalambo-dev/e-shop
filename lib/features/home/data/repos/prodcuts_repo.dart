import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/home/data/models/products_request_body.dart';
import 'package:eshop/features/home/data/models/products_response.dart';
import 'package:eshop/features/home/data/services/products_service.dart';

class ProductsRepo {
  final ProductsService _productsSerivce;

  ProductsRepo(this._productsSerivce);

  Future<ApiResult<ProductsResponse>> getProducts(
    ProductsRequestBody productsRequestBody,
  ) async {
    try {
      final response = await _productsSerivce.getProducts(productsRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
