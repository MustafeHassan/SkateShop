import 'package:flutter/material.dart';

import 'account_page.dart';
import 'map_page.dart';
import 'skate_reels/skate_reels_page.dart';
import 'the_store/cart_page.dart';
import 'the_store/store_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedScreenIndex = 0;
  static const List  _widgetOptions = [
    StorePage(),
    CartPage(),
    SkateReels(),
    MapPage(),
    Account()
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: Center(
        child: _widgetOptions.elementAt(_selectedScreenIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: _selectedScreenIndex == 2? const Color(0xffF4F4F4) : Colors.black,
        selectedItemColor: const Color(0xFFff0000),        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: _selectedScreenIndex == 2? Colors.black : const Color(0xffF4F4F4),
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/store.png"),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/shopping.png"),
            ),
            label: 'ShoppingCart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/reels.png"),
            ),
            label: 'SkateReels',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/map.png"),
            ),
            label: 'SkateParksMap',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/account.png"),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
