import 'package:flutter/material.dart';
import 'pages/login.dart'; // Import for LoginPage
import 'pages/register.dart'; // Import for RegisterPage
import 'pages/pay_bills.dart'; // Import for PayBillsPage
import 'pages/send_money.dart'; // Import for SendMoneyPage
import 'pages/dashboard.dart'; // Import for DashboardPage
import 'pages/buy_airtime.dart'; // Import for BuyAirtimePage
import 'pages/withdraw.dart'; // Import for WithdrawPage
import 'pages/bank_transfer.dart'; // Import for BankTransferPage
import 'pages/deposit.dart'; // Import for DepositPage

void main() {
  runApp(PocketBankingApp()); // Start the app
}

class PocketBankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Banking', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.teal, // Set the primary color theme
      ),
      initialRoute: '/', // Define the initial route
      routes: {
        '/': (context) => LoginPage(), // Route for LoginPage
        '/dashboard': (context) => DashboardPage(), // Route for DashboardPage
        '/register': (context) => RegisterPage(), // Route for RegisterPage
        '/paybills': (context) => PayBillsPage(), // Route for PayBillsPage
        '/sendmoney': (context) => SendMoneyPage(), // Route for SendMoneyPage
        '/buyairtime': (context) => BuyAirtimePage(), // Route for BuyAirtimePage
        '/withdraw': (context) => WithdrawPage(), // Route for WithdrawPage
        '/banktransfer': (context) => BankTransferPage(), // Route for BankTransferPage
        '/deposit': (context) => DepositPage(), // Route for DepositPage
      },
    );
  }
}
