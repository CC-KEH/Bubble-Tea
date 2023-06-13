import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return const GNav(
      tabs: [
        //Shop
        GButton(
          icon: Icons.shop,
          text: 'Shop',
        ),
        //Cart
        GButton(
          icon: Icons.shopping_bag,
          text: 'Cart',
        ),
      ],
    );
  }
}
