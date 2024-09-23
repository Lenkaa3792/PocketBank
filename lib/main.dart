import 'package:flutter/material.dart';
import 'pages/login.dart'; // Corrected import path for LoginPage
import 'pages/register.dart'; // Corrected import path for RegisterPage
import 'pages/pay_bills.dart'; // Corrected import path for PayBillsPage
import 'pages/send_money.dart'; // Corrected import path for SendMoneyPage
import 'pages/dashboard.dart'; // Corrected import path for DashboardPage

void main() {
  runApp(PocketBankingApp()); // Start the app by running the PocketBankingApp widget
}

// The main app class
class PocketBankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Banking', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.teal, // Set the primary color theme to teal
      ),
      initialRoute: '/', // Define the initial route of the app
      routes: {
        '/': (context) => LoginPage(), // Route for the LoginPage
        '/dashboard': (context) => DashboardPage(), // Route for the DashboardPage
        '/register': (context) => RegisterPage(), // Route for the RegisterPage
        '/paybills': (context) => PayBillsPage(), // Route for the PayBillsPage
        '/sendmoney': (context) => SendMoneyPage(), // Route for the SendMoneyPage
      },
    );
  }
}
