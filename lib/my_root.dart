import 'package:eshop/core/di/injection.dart';
import 'package:eshop/features/cart/ui/screens/cart_screen.dart';
import 'package:eshop/features/favorites/ui/screens/favorites_screen.dart';
import 'package:eshop/features/home/cubit/home_cubit.dart';
import 'package:eshop/features/home/ui/screens/home_screen.dart';
import 'package:eshop/features/shop/ui/screens/shop_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRoot extends StatefulWidget {
  const MyRoot({super.key});

  @override
  State<MyRoot> createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  int _selectedIndex = 0;
  
  static List<Widget> _screens = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getCategories()
        ..getProducts(),
      child: HomeScreen(),
    ),
    ShopScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10.sp,
        selectedFontSize: 10.sp,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_fill),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart_fill),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
