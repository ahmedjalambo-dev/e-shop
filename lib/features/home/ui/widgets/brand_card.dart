import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/widgets/cached_network_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  final String url;
  final void Function()? onTap;
  const BrandCard({super.key, required this.url, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: MyColor.mylightestGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 115.w,
            height: 50.h,
            child: CachedNetworkSvg(
              url: url,
              errorWidget: const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
