import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/features/shop/ui/widgets/category_tab_bar.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  final List<String> categories = [
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: categories.length,
      vsync: this,
      initialIndex: selectedIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop', style: MyTextStyle.font22w500Black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list_rounded),
            color: MyColor.myBlack,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
            color: MyColor.myBlack,
          ),
        ],
      ),
      body: Column(
        children: [
          // Animated Custom Tab Bar
          CategoryTabBar(
            categories: categories,
            selectedIndex: selectedIndex,
            tabController: _tabController,
            onTabChanged: (index) {
              setState(() => selectedIndex = index);
              _tabController.animateTo(index);
            },
          ),
          // Expanded Tab Bar View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                return Center(
                  child: Text(
                    'Category: ${category[0].toUpperCase()}${category.substring(1)}',
                    style: MyTextStyle.font14w400Black,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
