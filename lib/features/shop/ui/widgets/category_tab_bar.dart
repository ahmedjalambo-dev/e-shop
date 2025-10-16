import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';

class CategoryTabBar extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final TabController tabController;
  final ValueChanged<int> onTabChanged;

  const CategoryTabBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.tabController,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: List.generate(categories.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () => onTabChanged(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? MyColor.myBlack
                          : MyColor.mylightestGrey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      _capitalizeFirstLetter(categories[index]),
                      style: MyTextStyle.font14w500White.copyWith(
                        color: selectedIndex == index
                            ? Colors.white
                            : MyColor.myGrey,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }
}
