import 'package:blog_app/constans/styles/colors_const.dart';
import 'package:blog_app/screens/tabs/favorites_page.dart';
import 'package:blog_app/screens/tabs/profile_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class TabRouter extends StatefulWidget {
  const TabRouter({Key? key}) : super(key: key);

  @override
  State<TabRouter> createState() => _TabRouterState();
}

class _TabRouterState extends State<TabRouter> {
  var _currentIndex = 1;
  final List<Widget> _pages = [
    const FavoritesPage(),
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 91 / 844,
          child: BottomNavigationBar(
              onTap: (index) => setState(() => _currentIndex = index),
              currentIndex: _currentIndex,
              selectedItemColor: BlogAppColors.iconActive,
              unselectedItemColor: BlogAppColors.iconPassive,
              iconSize: 32,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
              ]),
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
