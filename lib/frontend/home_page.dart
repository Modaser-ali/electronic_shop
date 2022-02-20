import 'package:electronic_shop/frontend/favorite_list.dart';
import 'package:electronic_shop/frontend/profile.dart';
import 'package:electronic_shop/frontend/shop_screen.dart';
import 'package:electronic_shop/methods/provider_management.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> _list = [
    ShopScreen(),
    const FavoriteList(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ProviderManagement>(
        builder: (context, providerValue, child) => Scaffold(
            body: _list.elementAt(providerValue.currentPageIndex),
            extendBody: true,
            bottomNavigationBar: _bottomNavigation(providerValue)),
      ),
    );
  }

  Widget _bottomNavigation(ProviderManagement providerValue) {
    return DotNavigationBar(
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 0.1,
          blurRadius: 5.0,
          offset: Offset(0.5, -0.5),
        )
      ],
      currentIndex: providerValue.currentPageIndex,
      onTap: (index) {
        providerValue.changePage(
          index,
        );
      },
      dotIndicatorColor: Colors.black,
      // enableFloatingNavBar: false
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.home),
          selectedColor: Colors.orangeAccent,
        ),

        /// Favorite
        DotNavigationBarItem(
          icon: const Icon(Icons.favorite_border),
          selectedColor: Colors.red,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: const Icon(Icons.person),
          selectedColor: Colors.blue,
        ),
      ],
    );
  }
}
