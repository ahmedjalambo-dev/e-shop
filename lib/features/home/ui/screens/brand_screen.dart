import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/features/home/cubit/home_cubit.dart';
import 'package:eshop/features/home/cubit/home_state.dart';
import 'package:eshop/features/home/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandScreen extends StatelessWidget {
  final String category;
  const BrandScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.toUpperCase(), style: MyTextStyle.font22w500Black),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is ProductsLoading ||
            current is ProductsFailure ||
            current is ProductsSuccess,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => SizedBox.shrink(),
            productsFailure: (errorHandler) => SizedBox.shrink(),
            productsLoading: () => Center(child: CircularProgressIndicator()),
            productsSuccess: (productsResponse) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 20,
                childAspectRatio: 0.5,
              ),
              itemCount: productsResponse.items.length,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return ProductCard(
                  productImageUrl:
                      productsResponse.items[index].coverPictureUrl,
                  productName: productsResponse.items[index].name,
                  productDes: productsResponse.items[index].description,
                  productPrice: productsResponse.items[index].price.toInt(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
