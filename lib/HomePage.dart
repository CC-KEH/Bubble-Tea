import 'package:boba_tea/CartPage.dart';
import 'package:boba_tea/ShopPage.dart';
import 'package:flutter/material.dart';

import 'components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomNavbar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    //Shop page
    const ShopPage(),
    //Cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffe3cb),
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigateBottomNavbar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
