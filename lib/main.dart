import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:pocket_banking/keys/keys.dart';
import 'package:pocket_banking/pages/buy_goods.dart';
import 'package:pocket_banking/pages/splashscreen.dart';
import 'package:pocket_banking/services/firebase_service.dart';
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
import 'pages/loan_page.dart'; // Import for LoanPage
import 'pages/account_page.dart'; // Import for AccountPage
import 'package:get_it/get_it.dart';

void main() async {
//buy goods
  MpesaFlutterPlugin.setConsumerKey(kConsumerKey);
  MpesaFlutterPlugin.setConsumerSecret(kConsumerSecret);

  
  // Ensure binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyC2iTTtLEhDSWEMBSIp5BDADHzffaZQZNY",
    authDomain: "your-auth-domain",
    projectId: "solop-f7607",
    storageBucket: "solop-f7607.appspot.com",
    messagingSenderId: "823239436996",
    appId: "1:823239436996:android:eac6b8a5ab81a18cddf791",
  ));
  GetIt.instance.registerSingleton<FirebaseService>(
    FirebaseService(),
  );


  // Run the app
  runApp(PocketBankingApp()); 
}

class PocketBankingApp extends StatelessWidget {
  const PocketBankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pocket Banking',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/register': (context) => RegisterPage(),
        '/paybills': (context) => PayBillsPage(),
        '/sendmoney': (context) => SendMoneyPage(),
        '/buyairtime': (context) => BuyAirtimePage(),
        '/withdraw': (context) => WithdrawPage(),
        '/banktransfer': (context) => BankTransferPage(),
        '/deposit': (context) => DepositPage(),
        '/savings': (context) => SavingsPage(), 
        '/loans': (context) => LoanPage(), 
        '/account': (context) => AccountPage(),
        '/goods' : (context) => BuyGoodsPage(),
      },
    );
  }
}
