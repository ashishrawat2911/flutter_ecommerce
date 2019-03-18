import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/ui/home_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {return BottomNavigationBar(
    onTap: onTabTapped, // new
    currentIndex: _currentIndex,
    items: [
      new BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(home),
      ),
      new BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard),
        title: Text(category),
      ),
      new BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text(cart),
      ),
      new BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(account),
      )
    ],
  );}

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
