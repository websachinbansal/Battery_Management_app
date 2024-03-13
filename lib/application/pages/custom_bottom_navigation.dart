import 'package:flutter/material.dart';

import '../screens/mainscreen.dart';
import '../screens/setting_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  
  int _selectedIndex = 0;
  


final List<Widget> _pages = [
 const MainScreen(),
 const SettingPage()

];
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar : 
      
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Status Display',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_ethernet_outlined),
              label: 'Parameter Settings')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
