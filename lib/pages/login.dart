import 'package:flutter/material.dart';

// Defining the LoginPage class
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to PocketWallet', style: TextStyle(color: Colors.white)), // AppBar title
        backgroundColor: Colors.teal, // AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: <Widget>[
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium, // Uses the headline style from the app theme
            ),
            SizedBox(height: 20), // Space between title and email field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email', // Placeholder text
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Border style
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Focused border
              ),
            ),
            SizedBox(height: 10), // Space between email and password fields
            TextField(
              obscureText: true, // Hides the input for passwords
              decoration: InputDecoration(
                labelText: 'Password', // Placeholder text
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Border style
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Focused border
              ),
            ),
            SizedBox(height: 20), // Space before the login button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard'); // Navigate to Dashboard
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Button background color
                foregroundColor: Colors.black, // Button text color
              ),
              child: Text('Login'), // Button text
            ),
            SizedBox(height: 10), // Space before the register link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register'); // Navigate to Register page
              },
              child: Text('Don\'t have an account? Register here'), // Register link text
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
