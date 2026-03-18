import 'package:flutter/material.dart';
import 'package:my_ecommerce/pages/ProfilePage.dart';
import 'package:my_ecommerce/pages/chartPage.dart';
import 'package:my_ecommerce/pages/favouritePage.dart';
import 'package:my_ecommerce/pages/home.dart';
import 'package:my_ecommerce/pages/notificationPage.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidget();
}

class _BottomNavigationBarWidget extends State<BottomNavigationBarWidget> {
  int _currentIndex = 2;
  List page = [
    Notificationpage(),
    Favouritepage(),
    Home(),
    ChartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF416954),
        unselectedItemColor: Colors.grey,
        items: [
  BottomNavigationBarItem(icon: Icon(Icons.notifications_none , color: Color(0xFF416954),), activeIcon: Icon(Icons.notifications ,color: Color(0xFF416954),), label: "Notifications"),
  BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: Color(0xFF416954)), activeIcon: Icon(Icons.favorite, color: Color(0xFF416954)), label: "Favorites"),
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Color(0xFF416954)), activeIcon: Icon(Icons.home, color: Color(0xFF416954)), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, color: Color(0xFF416954)), activeIcon: Icon(Icons.shopping_cart, color: Color(0xFF416954)), label: "Cart"),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Color(0xFF416954)), activeIcon: Icon(Icons.person, color: Color(0xFF416954)), label: "Profile"),
],
      ),
    );
  }
}
