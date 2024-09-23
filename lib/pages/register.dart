import 'package:flutter/material.dart';

// Defining the RegisterPage class
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register to PocketWallet', style: TextStyle(color: Colors.white)), // AppBar title
        backgroundColor: Colors.teal, // AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: <Widget>[
            Text(
              'Register',
              style: Theme.of(context).textTheme.headlineMedium, // Uses a predefined text style from the app's theme
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
            SizedBox(height: 20), // Space before the register button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous page (Login)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Button background color
                foregroundColor: Colors.black, // Button text color
              ),
              child: Text('Register'), // Button text
            ),
          ],
        ),
      ),
    );
  }
}
