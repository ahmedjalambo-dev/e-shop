import 'package:eshop/core/extentions/extentions.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/features/home/cubit/home_cubit.dart';
import 'package:eshop/features/home/cubit/home_state.dart';
import 'package:eshop/features/home/ui/widgets/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseBrandBlocBuilder extends StatelessWidget {
  const ChooseBrandBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is CategoriesLoading ||
          current is CategoriesFailure ||
          current is CategoriesSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          categoriesLoading: () => Center(child: CircularProgressIndicator()),
          categoriesFailure: (errorHandler) => SizedBox.shrink(),
          categoriesSuccess: (categoriesResponse) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categoriesResponse.categories.length, (
                index,
              ) {
                return BrandCard(
                  onTap: () => context.pushNamed(
                    MyRoutes.brand,
                    arguments: categoriesResponse.categories[index].name,
                  ),
                  url: categoriesResponse.categories[index].coverPictureUrl,
                );
              }),
            ),
          ),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
