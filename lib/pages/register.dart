import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

// Defining the RegisterPage class
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Key to manage the form validation
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register to PocketWallet', style: TextStyle(color: Colors.white)), // AppBar title
        backgroundColor: Colors.teal, // AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Form(
          key: _formKey, // Form key for validation
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: <Widget>[
              Text(
                'Register',
                style: Theme.of(context).textTheme.headlineMedium, // Uses a predefined text style from the app's theme
              ),
              SizedBox(height: 20), // Space between title and email field

              // Email field
              TextFormField(
                controller: emailController, // Connect the controller to the email input
                decoration: InputDecoration(
                  labelText: 'Email', // Placeholder text
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Border style
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Focused border
                ),
                keyboardType: TextInputType.emailAddress, // Show email keyboard layout
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email'; // Error if the field is empty
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email'; // Error if the email format is invalid
                  }
                  return null; // No error if the field is valid
                },
              ),
              SizedBox(height: 10), // Space between email and password fields

              // Password field
              TextFormField(
                controller: passwordController, // Connect the controller to the password input
                obscureText: true, // Hides the input for passwords
                decoration: InputDecoration(
                  labelText: 'Password', // Placeholder text
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Border style
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)), // Focused border
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password'; // Error if the field is empty
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long'; // Error if the password is too short
                  }
                  return null; // No error if the field is valid
                },
              ),
              SizedBox(height: 20), // Space before the register button

              // Register button
              ElevatedButton(
                onPressed: () async {
                  // Validate the form before proceeding
                  if (_formKey.currentState!.validate()) {
                    try {
                      // Create a new user with Firebase
                      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      // If successful, navigate to the Dashboard
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    } on FirebaseAuthException catch (e) {
                      // Handle error during registration
                      String errorMessage;
                      if (e.code == 'weak-password') {
                        errorMessage = 'The password provided is too weak.';
                      } else if (e.code == 'email-already-in-use') {
                        errorMessage = 'The account already exists for that email.';
                      } else {
                        errorMessage = 'An error occurred. Please try again.';
                      }
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button background color
                  foregroundColor: Colors.white, // Button text color
                ),
                child: Text('Register'), // Button text
              ),
              SizedBox(height: 10), // Space before the login link

              // Login link
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/'); // Navigate back to Login page
                },
                child: Text('Already have an account? Login here'), // Login link text
                style: TextButton.styleFrom(
                  foregroundColor: Colors.teal, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
