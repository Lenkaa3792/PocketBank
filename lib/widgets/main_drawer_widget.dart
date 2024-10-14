import 'package:flutter/material.dart';

class MainDrawerWidget extends StatefulWidget {
  const MainDrawerWidget({super.key});

  @override
  State<MainDrawerWidget> createState() => _MainDrawerWidgetState();
}

class _MainDrawerWidgetState extends State<MainDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.teal],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Drawer(
        backgroundColor: Colors.teal,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              textColor: Colors.white,
              hoverColor: Colors.white,
              selectedColor: Colors.white,
              iconColor: Colors.white,
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            const Divider(
              height: 5.0,
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              textColor: Colors.white,
              hoverColor: Colors.white,
              selectedColor: Colors.white,
              iconColor: Colors.white,
              leading: const Icon(Icons.analytics),
              title: const Text('Analytics'),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            const Divider(
              height: 5.0,
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              textColor: Colors.white,
              hoverColor: Colors.white,
              selectedColor: Colors.white,
              iconColor: Colors.white,
              leading: const Icon(Icons.chat),
              title: const Text('Reach Out'),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            const Divider(
              height: 5.0,
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              textColor: Colors.white,
              hoverColor: Colors.white,
              selectedColor: Colors.white,
              iconColor: Colors.white,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle navigation to settings screen
              },
            ),
            const Divider(
              height: 5.0,
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              textColor: Colors.white,
              hoverColor: Colors.white,
              selectedColor: Colors.white,
              iconColor: Colors.white,
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                logOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  void logOut() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
