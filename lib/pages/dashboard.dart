import 'package:flutter/material.dart';
import 'package:pocket_banking/classes/dashboard_grid.dart';
import 'savings_page.dart';
import 'loan_page.dart';
import 'account_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late double deviceHeight, deviceWidth;

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const DashboardGrid(),
    const SavingsPage(),
    LoanPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'PocketWallet',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal.shade700,
          elevation: 10,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0), 
              child: Image.asset(
                'assets/images/logo.png', 
                height: 32, 
                width: 32, 
              ),
            ),
          ],
        ),
        drawer: drawerWidget(),
        body: AnimatedSwitcher(
          // Smooth transition between pages
          duration: const Duration(milliseconds: 300),
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.teal.shade800,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 14,
              unselectedFontSize: 12,
              iconSize: 28,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.savings), label: 'Savings'),
                BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Loan'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Account'),
              ],
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerWidget() {
    return Drawer(
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

              _logOut();
            },
          ),
        ],
      ),
    );
  }

  void _logOut() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
