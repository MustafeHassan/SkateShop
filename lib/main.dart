import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skate_iraq/view_models/product_viewmodel.dart';
import 'package:skate_iraq/views/map_page.dart';

import 'views/home_page.dart';
import 'views/categories.dart';
import 'views/skate_reels.dart';
import 'views/locations.dart';
import 'views/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skate Iraq',
        home: Main(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedScreenIndex = 0;
  static const List  _widgetOptions = [
   HomePage(),
   Categories(),
   SkateReels(),
   MapPage(),
   Profile()
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
        selectedItemColor: const Color(0xFFff0000),
        currentIndex: _selectedScreenIndex,
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
              AssetImage("assets/cate.png"),
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/reels.png"),
            ),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/map.png"),
            ),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/account.png"),
            ),
            label: 'Articles',
          ),
        ],
      ),
    );
  }
}
