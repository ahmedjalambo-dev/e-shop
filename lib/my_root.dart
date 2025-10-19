import 'package:eshop/core/di/injection.dart';
import 'package:eshop/features/cart/cubit/cart_cubit.dart';
import 'package:eshop/features/cart/cubit/cart_state.dart';
import 'package:eshop/features/cart/ui/screens/cart_screen.dart';
import 'package:eshop/features/home/cubit/home_cubit.dart';
import 'package:eshop/features/home/ui/screens/home_screen.dart';
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
    HomeScreen(),
    HomeScreen(),
    BlocProvider(
      create: (context) => getIt<CartCubit>()..getCart(),
      child: CartScreen(),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    // Fetch cart data when Cart tab (index 3) is selected, if not already loaded
    if (index == 3) {
      final cartCubit = getIt<CartCubit>();
      // Only fetch if initial or error state to avoid redundant calls
      cartCubit.state.maybeWhen(
        initial: () => cartCubit.getCart(),
        getCartFailure: (_) => cartCubit.getCart(),
        orElse: () {}, // Do nothing if already loading or success
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // Use IndexedStack to preserve state
        index: _selectedIndex,
        children: _screens,
      ),
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
