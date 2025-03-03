import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tidal/constant/constant.dart';
import 'package:tidal/screens/home_screen.dart';
import 'package:tidal/screens/explore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedItem = 0;

  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const Explore(),
    const Text('Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedItem],
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 0.3)),
        child: BottomNavigationBar(
            currentIndex: _selectedItem,
            onTap: _navigationBottomNavBar,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.home,
                  size: 30,
                  color: iconPrimaryColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.search,
                  size: 30,
                  color: iconPrimaryColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.category,
                  size: 30,
                  color: iconPrimaryColor,
                ),
                label: '',
              ),
            ]),
      ),
    );
  }
}
