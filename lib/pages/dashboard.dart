import 'package:flutter/material.dart';

// Main dashboard for the app
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState(); // Create state for the DashboardPage
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0; // Keeps track of the selected tab in the bottom navigation

  // List of pages to switch between when a tab is selected
  final List<Widget> _pages = <Widget>[
    DashboardGrid(), // Dashboard grid view for the home tab
    Center(child: Text('Savings Page')), // Placeholder for the savings page
    Center(child: Text('Loan Page')), // Placeholder for the loan page
    Center(child: Text('Account Page')), // Placeholder for the account page
  ];

  // Method to handle taps on the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index based on the tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ensures content is rendered within safe areas like notches or status bars
      child: Scaffold( // Main visual structure of the app
        appBar: AppBar( // Top bar with title and optional actions
          title: Text('PocketWallet'), // App bar title
          backgroundColor: Colors.teal, // Background color for the app bar
        ),
        body: _pages[_selectedIndex], // Display the current page based on the selected index
        bottomNavigationBar: BottomNavigationBar( // Bottom navigation bar for switching between pages
          currentIndex: _selectedIndex, // Highlight the currently selected tab
          onTap: _onItemTapped, // Set the tap handler to update the index
          selectedItemColor: Colors.teal, // Color of the selected item
          unselectedItemColor: Colors.grey, // Color of unselected items
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), // Home tab
            BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'), // Savings tab
            BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Loan'), // Loan tab
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'), // Account tab
          ],
        ),
      ),
    );
  }
}

// DashboardGrid is the grid layout displayed on the home page of the dashboard
class DashboardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Allows scrolling if content exceeds screen height
      child: GridView.count( // Create a grid view with a fixed number of columns
        crossAxisCount: 3, // Three columns in the grid
        shrinkWrap: true, // Shrinks the grid to fit its content
        physics: NeverScrollableScrollPhysics(), // Disable scrolling for this grid (handled by parent)
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Padding around the grid
        crossAxisSpacing: 12.0, // Horizontal space between grid items
        mainAxisSpacing: 16.0, // Vertical space between grid items
        children: <Widget>[
          _buildDashboardItem(context, Icons.send, 'Send Money', '/sendmoney'), // Send Money item
          _buildDashboardItem(context, Icons.payment, 'Pay Bills', '/paybills'), // Pay Bills item
          _buildDashboardItem(context, Icons.phone, 'Buy Airtime', '/buyairtime'), // Buy Airtime item
          _buildDashboardItem(context, Icons.attach_money, 'Withdraw', '/withdraw'), // Withdraw item
          _buildDashboardItem(context, Icons.sync_alt, 'Bank Transfer', '/banktransfer'), // Bank Transfer item
          _buildDashboardItem(context, Icons.account_balance_wallet, 'Deposit', '/deposit'), // Deposit item
        ],
      ),
    );
  }

  // Builds a single dashboard item (icon + label) that navigates to a new page when tapped
  Widget _buildDashboardItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector( // Detects tap events on the grid item
      onTap: () {
        Navigator.pushNamed(context, route); // Navigate to the route when the item is tapped
      },
      child: Card( // Creates a card-like visual element for each grid item
        color: Colors.white, // Card background color
        elevation: 2.0, // Shadow effect for the card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), // Rounded corners for the card
        child: Column( // Vertically aligns icon and text
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically in the card
          children: <Widget>[
            Icon(icon, size: 36.0, color: Colors.teal), // Icon displayed for the grid item
            SizedBox(height: 8.0), // Spacing between the icon and the text
            Text(label, style: TextStyle(fontSize: 12.0, color: Colors.teal)), // Label text under the icon
          ],
        ),
      ),
    );
  }
}
