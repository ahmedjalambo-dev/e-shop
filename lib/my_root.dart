import 'package:eshop/features/cart/ui/screens/cart_screen.dart';
import 'package:eshop/features/favorites/ui/screens/favorites_screen.dart';
import 'package:eshop/features/home/ui/screens/home_screen.dart';
import 'package:eshop/features/shop/ui/screens/shop_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRoot extends StatefulWidget {
  const MyRoot({super.key});

  @override
  State<MyRoot> createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  int _selectedIndex = 0;

  // Screens for the body of the Scaffold
  static const List<Widget> _screens = [
    HomeScreen(),
    ShopScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];

  // // 1. Add a list of titles corresponding to the screens
  // static const List<String> _appBarTitles = [
  //   'Home',
  //   'Shop',
  //   'Favorites',
  //   'My Cart',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // 2. Use the selected index to get the title dynamically
      //   // title: Text(_appBarTitles[_selectedIndex]),
      //   automaticallyImplyLeading: false,
      // ),
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
