import 'package:eshop/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Good Morning, Jack', style: MyTextStyle.font22w500Black),
        Spacer(),
        SvgPicture.asset(
          'assets/svgs/notification-icon.svg',
          width: 24.w,
          height: 24.h,
        ),
      ],
    );
  }
}
