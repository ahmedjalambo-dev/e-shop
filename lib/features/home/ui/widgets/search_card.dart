import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SvgPicture.asset('assets/svgs/search-icon.svg', width: 20.w),
            horizontalSapce(8),
            Text('Search for ...', style: MyTextStyle.font14w400Grey),
          ],
        ),
        decoration: BoxDecoration(
          color: MyColor.mylightestGrey,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
