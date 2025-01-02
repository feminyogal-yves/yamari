import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.orange[300],
        color: Colors.orange[200],
        tabActiveBorder: Border.all(color: Colors.orange),
        gap: 8,
        tabs: const [
          //shop tab
          GButton(
            icon: Icons.home,
            text: 'SHOP',
          ),

          //cart tab
          GButton(
            icon: Icons.shopping_bag,
            text: 'CART',
          ),
        ],
      ),
    );
  }
}
