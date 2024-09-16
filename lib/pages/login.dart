// Importing the Flutter Material package for UI components.
import 'package:flutter/material.dart';

// Defining the LoginPage class, which extends StatelessWidget.
// Since it's stateless, it doesn't hold any dynamic state.
class LoginPage extends StatelessWidget {
  // The build method returns the UI structure of the page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The Scaffold widget provides a framework that holds the app bar, body, etc.
      appBar: AppBar(
        // The AppBar is the top bar that typically holds the title and actions.
        title: Text(
          'Login to PocketWallet', 
          style: TextStyle(color: Colors.white), // Setting the AppBar title text to white.
        ),
        backgroundColor: Colors.teal, // Setting the AppBar background to teal.
      ),

      // The body of the page is wrapped with padding to add spacing around the content.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding adds 16 pixels of space around the content.
        
        // Column widget arranges its children in a vertical direction.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically.
          children: <Widget>[
            // A Text widget displays the 'Login' title at the top of the form.
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium, // Uses the headline style from the app theme.
            ),
            
            // SizedBox adds vertical space (20 pixels) between the title and the next widget.
            SizedBox(height: 20),
            
            // TextField for the email input field.
            TextField(
              decoration: InputDecoration(
                labelText: 'Email', // Label displayed inside the input field.
                
                // Adding a black border around the input field.
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black border when not focused.
                ),
                
                // Black border when the input field is focused (clicked or selected).
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black border when focused.
                ),
              ),
            ),
            
            // SizedBox adds vertical space (10 pixels) between the email and password fields.
            SizedBox(height: 10),
            
            // Another TextField for the password input.
            TextField(
              obscureText: true, // Hides the input (used for passwords).
              decoration: InputDecoration(
                labelText: 'Password', // Label displayed inside the password input field.
                
                // Adding a black border around the password field.
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black border when not focused.
                ),
                
                // Black border when the password field is focused.
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black border when focused.
                ),
              ),
            ),
            
            // SizedBox adds vertical space (20 pixels) between the password field and the Login button.
            SizedBox(height: 20),
            
            // ElevatedButton is a clickable button that performs an action when pressed.
            ElevatedButton(
              onPressed: () {
                // After pressing the login button, navigate to the dashboard page.
                // `Navigator.pushReplacementNamed` replaces the current page with the dashboard page.
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              
              // Styling the button: Teal background with black text.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Teal background color for the button.
                foregroundColor: Colors.black, // Black text color on the button.
              ),
              
              // The text shown inside the button.
              child: Text('Login'),
            ),
            
            // SizedBox adds vertical space (10 pixels) between the Login button and the TextButton.
            SizedBox(height: 10),
            
            // TextButton is a clickable text that navigates to the register page.
            TextButton(
              onPressed: () {
                // Navigating to the Register page when the text button is clicked.
                Navigator.pushNamed(context, '/register'); // Go to the register page.
              },
              
              // The text inside the TextButton.
              child: Text('Don\'t have an account? Register here'), // Displayed text for registration link.
              
              // Styling the TextButton: Teal text color.
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal, // Teal text color for the button.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
