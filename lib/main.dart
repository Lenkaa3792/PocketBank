// Importing the Flutter Material package to use material design components.
import 'package:flutter/material.dart';

// Importing the pages for login, register, and dashboard functionality.
//IMPORTS THE LOGIN PAGE
import 'package:pocket_banking/pages/login.dart';
//IMPORTS THE REGISTER PAGE
import 'package:pocket_banking/pages/register.dart';
//IMPORTS THE DASHBOARD PAGE
import 'package:pocket_banking/pages/dashboard.dart';

// The main function is the entry point of the app.
// It calls the runApp() method to start the PocketBankingApp.
void main() {
  runApp(PocketBankingApp()); // Starts the PocketBankingApp widget.
}

// PocketBankingApp class, which is a StatelessWidget.
// This defines the overall structure and theme of the app.
class PocketBankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root widget of the app.
    return MaterialApp(
      title: 'Pocket Banking', // Title of the app displayed in the task manager.
      
      // Defining the theme for the app.
      theme: ThemeData(
        primaryColor: Colors.teal, // Setting teal as the primary color for the app.
        
        // Defining a color scheme with teal as the primary swatch.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal, // Using a teal color scheme.
        ).copyWith(
          secondary: Colors.tealAccent, // Setting tealAccent as the secondary color.
        ),
        
        // Defining text themes for various parts of the app.
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal), // Styling for large headlines.
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black), // Styling for body text.
        ),
        
        // Defining the default button style for older buttons.
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal, // Teal color for buttons.
          textTheme: ButtonTextTheme.primary, // Ensures that button text color is suitable for the button background.
        ),
        
        // Styling for modern ElevatedButtons.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Setting teal as the background color for ElevatedButtons.
          ),
        ),
      ),
      
      // Defining the dark theme for the app.
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal, // Teal as the primary color for dark mode.
        
        // Defining a color scheme for dark mode.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal, // Using teal as the main color in dark mode.
        ).copyWith(
          secondary: Colors.tealAccent, // TealAccent as the secondary color in dark mode.
        ),
        
        // Defining text themes for dark mode.
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.tealAccent), // Styling for headlines in dark mode.
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white), // Styling for body text in dark mode.
        ),
        
        // Styling for ElevatedButtons in dark mode.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Teal background for buttons in dark mode.
          ),
        ),
      ),
      
      // Setting the app to automatically switch between light and dark mode based on the system settings.
      themeMode: ThemeMode.system, // System-defined theme mode (light/dark).

      // Defining the initial route of the app, which is the login page.
      initialRoute: '/',

      // Defining the routes for navigation between different pages.
      routes: {
        '/': (context) => LoginPage(), // Root route loads the LoginPage.
        '/register': (context) => RegisterPage(), // '/register' route loads the RegisterPage.
        '/dashboard': (context) => DashboardPage(), // '/dashboard' route loads the DashboardPage.
      },
    );
  }
}
