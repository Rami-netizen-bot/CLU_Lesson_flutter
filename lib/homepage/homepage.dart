import 'package:coffee_app/component/bottom_nav.dart';
import 'package:coffee_app/conts.dart';
import 'package:coffee_app/homepage/cardPage.dart';
import 'package:coffee_app/homepage/shoppage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() => _selectedIndex = index);
  }

  final List<Widget> _pages = [Shoppage(), Cardpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ── DRAWER ──────────────────────────────────────────
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: Column(
          children: [
            // Header with logo
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Center(
                child: Image.asset('lib/Images/logo.png', height: 100),
              ),
            ),

            // Home tile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                selected: _selectedIndex == 0,
                selectedTileColor: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context); // close drawer
                },
              ),
            ),

            // Cart tile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListTile(
                leading: const Icon(Icons.shopping_bag_outlined),
                title: const Text(
                  "Cart",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                selected: _selectedIndex == 1,
                selectedTileColor: Colors.brown[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context); // close drawer
                },
              ),
            ),

            // About tile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),

            const Spacer(),

            // Logout tile
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 28),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),

      // ── APP BAR ─────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Brew Day",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // ✅ hamburger icon opens drawer automatically
      ),

      // ── BOTTOM NAV ──────────────────────────────────────
      bottomNavigationBar: MybottomNavbar(
        onTapchange: (index) => navigateBottomBar(index),
      ),

      // ── BODY ────────────────────────────────────────────
      body: _pages[_selectedIndex],
    );
  }
}
