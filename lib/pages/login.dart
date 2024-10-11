import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

// Defining the LoginPage class
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double deviceHeight, deviceWidth;
  // Controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Key to manage the form validation
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        title: Text('Login to PocketWallet',
            style: TextStyle(color: Colors.white)), // AppBar title
        backgroundColor: Colors.teal, // AppBar background color
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
          padding: const EdgeInsets.all(16.0), // Padding around the content
          child: Form(
            key: _formKey, // Form key for validation
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              children: <Widget>[
                SizedBox(
                  height: deviceHeight * 0.2,
                  width: deviceWidth * 0.2,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                      child: Image.asset('assets/images/logo.png')),
                ),
                Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium, // Uses the headline style from the app theme
                ),
                SizedBox(
                    height: deviceHeight *
                        0.03), // Space between title and email field

                // Email field
                TextFormField(
                  controller:
                      emailController, // Connect the controller to the email input
                  decoration: InputDecoration(
                    labelText: 'Email', // Placeholder text
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black)), // Border style
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black)), // Focused border
                  ),
                  keyboardType:
                      TextInputType.emailAddress, // Show email keyboard layout
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
                SizedBox(
                    height: deviceHeight *
                        0.03), // Space between email and password fields

                // Password field
                TextFormField(
                  controller:
                      passwordController, // Connect the controller to the password input
                  obscureText: true, // Hides the input for passwords
                  decoration: InputDecoration(
                    labelText: 'Password', // Placeholder text
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black)), // Border style
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black)), // Focused border
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password'; // Error if the field is empty
                    }
                    return null; // No error if the field is valid
                  },
                ),
                SizedBox(
                    height:
                        deviceHeight * 0.03), // Space before the login button

                // Login button
                ElevatedButton(
                  onPressed: () async {
                    // Validate the form before proceeding
                    if (_formKey.currentState!.validate()) {
                      try {
                        // Sign in the user with Firebase
                        UserCredential userCredential =
                            await _auth.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        // If successful, navigate to the Dashboard
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      } on FirebaseAuthException catch (e) {
                        // Handle error during sign-in
                        String errorMessage;
                        if (e.code == 'user-not-found') {
                          errorMessage = 'No user found for that email.';
                        } else if (e.code == 'wrong-password') {
                          errorMessage =
                              'Wrong password provided for that user.';
                        } else {
                          errorMessage = 'An error occurred. Please try again.';
                        }
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage)));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent, // Button background color
                    foregroundColor: Colors.white, // Button text color
                  ),
                  child: Text('Login'), // Button text
                ),
                SizedBox(
                    height:
                        deviceHeight * 0.03), // Space before the register link

                // Register link
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/register'); // Navigate to Register page
                  }, // Register link text
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.teal, // Text color
                  ),
                  child: Text(
                    'Don\'t have an account? Register here',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
