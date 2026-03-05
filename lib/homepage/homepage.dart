import 'package:coffee_app/component/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/conts.dart';
import 'package:coffee_app/homepage/cardPage.dart';
import 'package:coffee_app/homepage/shoppage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [Shoppage(), Cardpage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MybottomNavbar(
        onTapchange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
