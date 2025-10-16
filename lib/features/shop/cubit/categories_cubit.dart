import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/shop/cubit/categories_state.dart';
import 'package:eshop/features/shop/data/repos/categories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesState.initial());

  Future<void> getCategories() async {
    emit(CategoriesState.categoriesLoading());
    final response = await categoriesRepo.getCategories();
    response.when(
      success: (categoriesResponse) {
        emit(CategoriesState.categoriesSuccess(categoriesResponse));
      },
      failure: (errorHandler) {
        emit(CategoriesState.categoriesFailure(errorHandler));
      },
    );
  }
}
