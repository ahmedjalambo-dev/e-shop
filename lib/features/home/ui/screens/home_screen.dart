import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/features/home/ui/widgets/choose_brand_bloc_builder.dart';
import 'package:eshop/features/home/ui/widgets/popular_now_bloc_builder.dart';
import 'package:eshop/features/home/ui/widgets/search_card.dart';
import 'package:eshop/features/home/ui/widgets/title_with_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Morning, Ahmed', style: MyTextStyle.font22w500Black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
              color: MyColor.myBlack,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            verticalSapce(12),
            SearchCard(),
            verticalSapce(12),
            TitleWithSeeAll(title: 'Choose Brand'),
            ChooseBrandBlocBuilder(),
            verticalSapce(24),
            TitleWithSeeAll(title: 'Popular Now'),
            PopularNowBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
