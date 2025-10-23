import 'package:eshop/core/di/injection.dart';
import 'package:eshop/features/cart/cubit/cart_cubit.dart';
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
  late final CartCubit _cartCubit;

  @override
  void initState() {
    super.initState();
    _cartCubit = getIt<CartCubit>();
  }

  List<Widget> get _screens => [
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getCategories()
        ..getProducts(),
      child: const HomeScreen(),
    ),
    const Center(child: Text('Shop')),
    const Center(child: Text('Favorites')),
    BlocProvider.value(value: _cartCubit, child: const CartScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    // Refresh cart when navigating to cart tab
    if (index == 3) {
      _cartCubit.getCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
