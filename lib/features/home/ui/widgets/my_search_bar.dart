import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


// SearchBar(
//       elevation: WidgetStateProperty.all(0),
//       backgroundColor: WidgetStateProperty.all(MyColor.mylightestGrey),
//       shape: WidgetStateProperty.all(
//         RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
//       ),
//       hintText: 'Search for ...',
//       hintStyle: WidgetStateProperty.all(MyTextStyle.font14w400Grey),
//       leading: SvgPicture.asset('assets/svgs/search-icon.svg', width: 20.w),
//       padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 12)),
//     );