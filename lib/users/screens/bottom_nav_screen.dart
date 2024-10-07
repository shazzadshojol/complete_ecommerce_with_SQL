import 'package:complete_ecommerce/users/controllers/bottom_nav_controller.dart';
import 'package:complete_ecommerce/users/screens/cart_screen.dart';
import 'package:complete_ecommerce/users/screens/home_screen.dart';
import 'package:complete_ecommerce/users/screens/profile_screen.dart';
import 'package:complete_ecommerce/users/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  final BottomNavBarController _bottomNavBarController =
      Get.put(BottomNavBarController());

  final List<Widget> _screenList = [
    const HomeScreen(),
    const CartScreen(),
    const WishListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screenList[_bottomNavBarController.selectedPage.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: _bottomNavBarController.selectedPage.value,
            onTap: (index) {
              _bottomNavBarController.changePage(index);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            items: [
              _buildNavBarItem(Icons.home_outlined, 0),
              _buildNavBarItem(Icons.shopping_cart_outlined, 1),
              _buildNavBarItem(Icons.favorite_border_outlined, 2),
              _buildNavBarItem(Icons.account_circle_outlined, 3),
            ],
          )),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(IconData iconData, int index) {
    return BottomNavigationBarItem(
      icon: Obx(() => _bottomNavBarController.selectedPage.value == index
          ? Container(
              padding:
                  const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Icon(iconData, color: Colors.blue),
            )
          : Icon(
              iconData,
              color: Colors.blue,
            )),
      label: '',
    );
  }
}
