import 'package:flutter/material.dart';

// Main dashboard for the app
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0; // Keeps track of the selected tab in the bottom navigation

  // List of pages to switch between
  final List<Widget> _pages = <Widget>[
    DashboardGrid(), // Grid view for dashboard items
    Center(child: Text('Savings Page')),
    Center(child: Text('Loan Page')),
    Center(child: Text('Account Page')),
  ];

  // Handler for tapping a navigation item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PocketWallet'), // App bar title
          backgroundColor: Colors.teal,
        ),
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, // Current selected index
          onTap: _onItemTapped, // Tap handler
          selectedItemColor: Colors.teal, // Selected item color
          unselectedItemColor: Colors.grey, // Unselected item color
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Loan'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
          ],
        ),
      ),
    );
  }
}

// DashboardGrid is the grid layout on the main screen
class DashboardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: 3, // Three columns in the grid
        shrinkWrap: true, // Shrinks the grid size to fit its content
        physics: NeverScrollableScrollPhysics(), // Prevents independent scrolling
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Padding around the grid
        crossAxisSpacing: 12.0, // Horizontal space between grid items
        mainAxisSpacing: 16.0, // Vertical space between grid items
        children: <Widget>[
          _buildDashboardItem(context, Icons.send, 'Send Money', '/sendmoney'),
          _buildDashboardItem(context, Icons.payment, 'Pay Bills', '/paybills'),
          _buildDashboardItem(context, Icons.phone, 'Buy Airtime', '/buyairtime'),
          _buildDashboardItem(context, Icons.attach_money, 'Withdraw', '/withdraw'),
          _buildDashboardItem(context, Icons.sync_alt, 'Bank Transfer', '/banktransfer'),
          _buildDashboardItem(context, Icons.account_balance_wallet, 'Deposit', '/deposit'),
        ],
      ),
    );
  }

  // Builds a single dashboard item (icon + text)
  Widget _buildDashboardItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route); // Navigate to the corresponding route
      },
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), // Rounded card shape
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: <Widget>[
            Icon(icon, size: 36.0, color: Colors.teal), // Icon for the grid item
            SizedBox(height: 8.0), // Space between icon and text
            Text(label, style: TextStyle(fontSize: 12.0, color: Colors.teal)), // Label below the icon
          ],
        ),
      ),
    );
  }
}
