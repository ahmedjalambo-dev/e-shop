import 'package:eshop/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';

class TitleWithSeeAll extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const TitleWithSeeAll({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(title, style: MyTextStyle.font18w600Black),
          Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text('See All', style: MyTextStyle.font16w500Grey),
          ),
        ],
      ),
    );
  }
}
