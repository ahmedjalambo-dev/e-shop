import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/home/cubit/home_state.dart';
import 'package:eshop/features/home/data/models/products_request_body.dart';
import 'package:eshop/features/home/data/repos/categories_repo.dart';
import 'package:eshop/features/home/data/repos/prodcuts_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoriesRepo _categoriesRepo;
  final ProductsRepo _prodcutsRepo;
  HomeCubit(this._categoriesRepo, this._prodcutsRepo)
    : super(const HomeState.initial());

  Future<void> getCategories() async {
    emit(const HomeState.categoriesLoading());
    final response = await _categoriesRepo.getCategories();
    response.when(
      success: (categoriesResponse) =>
          emit(HomeState.categoriesSuccess(categoriesResponse)),
      failure: (errorHandler) =>
          emit(HomeState.categoriesFailure(errorHandler)),
    );
  }

  Future<void> getProducts() async {
    emit(const HomeState.productsLoading());
    final response = await _prodcutsRepo.getProducts(
      ProductsRequestBody(pageSize: 20),
    );
    response.when(
      success: (productsResponse) =>
          emit(HomeState.productsSuccess(productsResponse)),
      failure: (errorHandler) => emit(HomeState.productsFailure(errorHandler)),
    );
  }
}
