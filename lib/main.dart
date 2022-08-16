import 'package:flutter/material.dart';
import 'package:skate_iraq/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skate Iraq',
      home: Main(),
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
  static const List<Widget> _widgetOptions = <Widget>[
   HomePage(),
   HomePage(),
   HomePage(),
   HomePage(),
   HomePage(),

  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: Image.asset('assets/Logo.png'),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedScreenIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xFFff0000),
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        elevation: 0,

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
