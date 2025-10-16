import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/features/shop/data/models/categories_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;

  const factory CategoriesState.categoriesLoading() = CategoriesLoading;
  const factory CategoriesState.categoriesSuccess(
    CategoriesResponse categoriesResponse,
  ) = CategoriesSuccess;
  const factory CategoriesState.categoriesFailure(ErrorHandler errorHandler) =
      CategoriesFailure;
}
