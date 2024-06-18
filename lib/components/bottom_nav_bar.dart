import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/controllers/products_controller.dart';
import 'package:flutter_shopping_app/resources/strings.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  final void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<ProductsController>(context);

    return Container(
      height: 80,
      margin: const EdgeInsets.all(10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.black),
        tabs: [
          const GButton(
            icon: Icons.home,
            iconColor: Colors.black,
            text: Strings.shop,
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: Strings.cart,
            leading: Badge.count(
              count: productsController.totalItems,
              backgroundColor: productsController.totalItems != 0
                  ? Colors.red
                  : Colors.black,
              child: const Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
