import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/features/home/data/models/categories_response.dart';
import 'package:eshop/features/home/data/models/products_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // categories
  const factory HomeState.categoriesLoading() = CategoriesLoading;
  const factory HomeState.categoriesSuccess(
    CategoriesResponse categoriesResponse,
  ) = CategoriesSuccess;
  const factory HomeState.categoriesFailure(ErrorHandler errorHandler) =
      CategoriesFailure;

  // products
  const factory HomeState.productsLoading() = ProductsLoading;
  const factory HomeState.productsSuccess(ProductsResponse productsResponse) =
      ProductsSuccess;
  const factory HomeState.productsFailure(ErrorHandler errorHandler) =
      ProductsFailure;
}
