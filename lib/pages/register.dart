// Importing the Flutter Material package for UI components.
import 'package:flutter/material.dart';

// Defining the RegisterPage class, which extends StatelessWidget.
// This means the page is immutable and doesn't have a state.
class RegisterPage extends StatelessWidget {
  // The build method describes how to display the UI for this page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides a basic layout structure for the app.
      appBar: AppBar(
        // AppBar is the top bar for the screen, usually containing a title or actions.
        title: Text(
          'Register to PocketWallet', 
          style: TextStyle(color: Colors.white), // Sets the AppBar title text color to white.
        ),
        backgroundColor: Colors.teal, // Teal color for the AppBar background.
      ),
      
      // The body of the page is wrapped in Padding for spacing.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding adds space (16 pixels) around the content.
        
        // Column widget arranges its children vertically.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center-aligns the content vertically.
          children: <Widget>[
            // A Text widget to display the 'Register' title at the top of the form.
            Text(
              'Register',
              style: Theme.of(context).textTheme.headlineMedium, // Uses a predefined text style from the app's theme.
            ),
            
            // SizedBox adds a vertical gap of 20 pixels between the text and the next element.
            SizedBox(height: 20),
            
            // TextField widget allows the user to input text (in this case, for the email field).
            TextField(
              decoration: InputDecoration(
                labelText: 'Email', // Placeholder text showing 'Email'.
                
                // Adding a black border around the input field.
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Sets the border color to black.
                ),
                
                // When the TextField is focused, the border turns black.
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Sets focused border color to black.
                ),
              ),
            ),
            
            // Another SizedBox for spacing (10 pixels) between the email and password fields.
            SizedBox(height: 10),
            
            // Another TextField widget, this time for password input.
            // `obscureText: true` hides the text input (used for passwords).
            TextField(
              obscureText: true, // Hides the text input for password fields.
              decoration: InputDecoration(
                labelText: 'Password', // Placeholder text showing 'Password'.
                
                // Adding a black border around the input field, similar to the email field.
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black border around the input field.
                ),
                
                // When focused, the border will also be black.
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Black border when the field is focused.
                ),
              ),
            ),
            
            // A gap (20 pixels) between the password field and the Register button.
            SizedBox(height: 20),
            
            // ElevatedButton is a clickable button that performs an action when pressed.
            ElevatedButton(
              onPressed: () {
                // Navigator.pop() removes the current page (Register) and returns to the previous page (Login).
                Navigator.pop(context); // Go back to the Login page after the user registers.
              },
              
              // Styling the button: Background color is teal and text color is black.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Teal button background.
                foregroundColor: Colors.black, // Black text on the button.
              ),
              
              // The text shown inside the button.
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
