import 'package:flutter/material.dart'; // Importing Flutter material package for UI components

// AccountPage is a StatelessWidget that represents the account overview screen
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides the basic visual structure for the page
      appBar: AppBar(
        // AppBar widget for the top bar
        title: const Text('Account Overview'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          // Padding around the body content
          padding: const EdgeInsets.all(
              16.0), // Padding value set to 16 pixels on all sides
          child: Column(
            // Column widget to arrange child widgets vertically
            crossAxisAlignment: CrossAxisAlignment
                .start, // Align children to the start of the column
            children: <Widget>[
              // Displaying account holder's name
              const Text(
                'Account Holder: Allan Allan', // Text displaying account holder's name
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), // Styling the text
              ),
              const SizedBox(height: 10), // Spacing between elements
              // Displaying account number
              const Text(
                'Account Number: 1234567890', // Text displaying account number
                style: TextStyle(fontSize: 16), // Styling the text
              ),
              const SizedBox(height: 10), // Spacing between elements
              // Displaying account balance
              const Text(
                'Account Balance: \$5,000', // Text displaying account balance
                style: TextStyle(fontSize: 16), // Styling the text
              ),
              const SizedBox(height: 20), // Spacing between elements
              // Section title for account details
              const Text(
                'Account Details', // Section title text
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold), // Styling the title
              ),
              // ListTile displaying email information
              const ListTile(
                title:
                    Text('Email: allan@example.com'), // Text displaying email
              ),
              // ListTile displaying phone information
              const ListTile(
                title: Text(
                    'Phone: +254 778 567-8901'), // Text displaying phone number
              ),
              const SizedBox(height: 20), // Spacing between elements
              // Button for editing account settings
              ElevatedButton(
                onPressed: () {
                  // Handle account settings logic
                  _showAccountSettings(
                      context); // Call to show account settings dialog
                }, // Button text
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text('Edit Account Settings'), // Button color
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to show account settings dialog
  void _showAccountSettings(BuildContext context) {
    showDialog(
      context: context, // Context for the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          // AlertDialog widget for showing messages
          title: const Text('Account Settings'), // Title of the dialog
          content: const Text(
              'You can edit your account settings here.'), // Content of the dialog
          actions: <Widget>[
            // Button to close the dialog
            TextButton(
              child: const Text('OK'), // Button text
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog when pressed
              },
            ),
          ],
        );
      },
    );
  }
}
