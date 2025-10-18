import 'package:eshop/features/home/cubit/home_cubit.dart';
import 'package:eshop/features/home/cubit/home_state.dart';
import 'package:eshop/features/home/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularNowBlocBuilder extends StatelessWidget {
  const PopularNowBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is ProductsLoading ||
          current is ProductsFailure ||
          current is ProductsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          productsLoading: () => Center(child: CircularProgressIndicator()),
          productsFailure: (errorHandler) => SizedBox.shrink(),
          productsSuccess: (productsResponse) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(productsResponse.items.length, (index) {
                return ProductCard(
                  horizontalPadding: 12,
                  productImageUrl:
                      productsResponse.items[index].coverPictureUrl,
                  productName: productsResponse.items[index].name,
                  productDes: productsResponse.items[index].description,
                  productPrice: productsResponse.items[index].price.toInt(),
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
