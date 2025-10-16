import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/shop/data/models/categories_response.dart';
import 'package:eshop/features/shop/data/services/categories_service.dart';

class CategoriesRepo {
  final CategoriesService _categoriesService;

  CategoriesRepo(this._categoriesService);

  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      final response = await _categoriesService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
