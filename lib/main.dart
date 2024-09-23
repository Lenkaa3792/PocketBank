import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/pay_bills.dart';
import 'pages/send_money.dart';
import 'pages/dashboard.dart';
import 'pages/buy_airtime.dart';
import 'pages/withdraw.dart';
import 'pages/bank_transfer.dart';
import 'pages/deposit.dart';
import 'pages/savings_page.dart'; // Import for SavingsPage
import 'pages/loan_page.dart';     // Import for LoanPage
import 'pages/account_page.dart';   // Import for AccountPage

void main() {
  runApp(PocketBankingApp());
}

class PocketBankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Banking',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/register': (context) => RegisterPage(),
        '/paybills': (context) => PayBillsPage(),
        '/sendmoney': (context) => SendMoneyPage(),
        '/buyairtime': (context) => BuyAirtimePage(),
        '/withdraw': (context) => WithdrawPage(),
        '/banktransfer': (context) => BankTransferPage(),
        '/deposit': (context) => DepositPage(),
        '/savings': (context) => SavingsPage(), // Route for SavingsPage
        '/loans': (context) => LoanPage(),       // Route for LoanPage
        '/account': (context) => AccountPage(),   // Route for AccountPage
      },
    );
  }
}
