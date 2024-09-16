// Importing the Flutter Material package to use the material design components.
import 'package:flutter/material.dart';

// Defining the DashboardPage class, which extends StatelessWidget.
// This page displays a grid of options (e.g., Send Money, Pay Bills).
class DashboardPage extends StatelessWidget {
  // The build method returns the UI structure of the page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides the overall structure of the screen.
      appBar: AppBar(
        // AppBar at the top with a title 'Dashboard'.
        title: Text('Dashboard'),
        backgroundColor: Colors.teal, // Setting AppBar background color to teal.
      ),

      // The body contains a GridView that shows dashboard items in a grid layout.
      body: GridView.count(
        crossAxisCount: 2, // Display two items per row.
        padding: EdgeInsets.all(16.0), // Add padding around the grid items.
        
        // The children property holds the dashboard items.
        children: <Widget>[
          // Build a dashboard item for 'Send Money' with an icon and label.
          _buildDashboardItem(context, Icons.send, 'Send Money', '/sendmoney'),
          
          // Build another dashboard item for 'Pay Bills' with an icon and label.
          _buildDashboardItem(context, Icons.payment, 'Pay Bills', '/paybills'),
          
          // You can add more items here as needed.
        ],
      ),
    );
  }

  // A helper function that builds individual dashboard items.
  // Takes the context, icon, label, and route for navigation.
  Widget _buildDashboardItem(BuildContext context, IconData icon, String label, String route) {
    // GestureDetector allows detecting taps on the card.
    return GestureDetector(
      // When tapped, navigate to the specified route.
      onTap: () => Navigator.pushNamed(context, route), // Navigates to a specific page based on the route.
      
      // The card visually represents the dashboard item with an icon and label.
      child: Card(
        elevation: 5, // Adds a shadow effect to the card to give it some depth.
        margin: EdgeInsets.all(8.0), // Adds margin around each card.
        
        // The Column widget arranges the icon and text vertically.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center both the icon and label in the card.
          
          // Children widgets inside the column.
          children: <Widget>[
            // Icon widget to display an icon for the dashboard item.
            Icon(icon, size: 50, color: Colors.teal), // The icon is displayed in teal color and sized at 50.
            
            // SizedBox adds vertical spacing between the icon and the label.
            SizedBox(height: 10),
            
            // Text widget to display the label (e.g., 'Send Money', 'Pay Bills').
            Text(label, style: Theme.of(context).textTheme.bodyMedium), // Displays the label with the app's text style.
          ],
        ),
      ),
    );
  }
}
