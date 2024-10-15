import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

// Defining the SendMoneyPage class
class BuyGoodsPage extends StatefulWidget {
  const BuyGoodsPage({super.key});

  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<BuyGoodsPage> {
  // Controllers to manage the input fields
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Form key to manage validation
  final _formKey = GlobalKey<FormState>();

  // transaction function
  Future<dynamic> startTransaction(
      {required double amount, required String recipient}) async {
    dynamic transactionInitialisation;

    //Wrap it with a try-catch
    try {
      //Run it
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode:
                  "174379", //use your store number if the transaction type is CustomerBuyGoodsOnline
              transactionType: TransactionType
                  .CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
              amount: amount,
              partyA: recipient,
              partyB: "174379",
              callBackURL: Uri(
                  scheme: "https",
                  host: "1234.1234.co.ke",
                  path: "/1234.php"), //send the data to the backend
              accountReference: "solomon ondula payment API testings",
              phoneNumber: recipient,
              baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
              transactionDesc: "testing transactions",
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

      print("result: $transactionInitialisation");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Goods'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
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
          padding: const EdgeInsets.all(16.0), // Add padding around the content
          child: Form(
            key: _formKey, // Connect form key for validation
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the column vertically
              children: [
                // Input field for recipient's number
                TextFormField(
                  controller:
                      recipientController, // Connect the controller to the input field
                  decoration: const InputDecoration(
                    labelText:
                        'Buyer\'s Number', // Label displayed in the input field
                    border:
                        OutlineInputBorder(), // Outline border style for the input field
                  ),
                  keyboardType: TextInputType
                      .phone, // Show numeric keyboard for phone number input
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the recipient\'s number'; // Error if the field is empty
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number'; // Ensure valid phone number
                    }
                    return null; // No error if the field is valid
                  },
                ),
                const SizedBox(height: 16.0), // Add space between the fields

                // Input field for amount
                TextFormField(
                  controller:
                      amountController, // Connect the controller to the input field
                  decoration: const InputDecoration(
                    labelText: 'Amount', // Label displayed in the input field
                    border:
                        OutlineInputBorder(), // Outline border style for the input field
                  ),
                  keyboardType: TextInputType
                      .number, // Show numeric keyboard for amount input
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount'; // Error if the field is empty
                    }
                    if (double.tryParse(value) == null ||
                        double.parse(value) <= 0) {
                      return 'Please enter a valid amount greater than 0'; // Ensure valid number and non-negative
                    }
                    return null; // No error if the field is valid
                  },
                ),
                const SizedBox(
                    height: 20.0), // Add space between the fields and button

                // Send Money button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      double amount = double.parse(amountController.text);
                      String recipient = recipientController.text;

                      // Format the recipient number to include country code if necessary
                      if (recipient.startsWith('0')) {
                        recipient = '254' + recipient.substring(1);
                      }

                      await startTransaction(
                          amount: amount, recipient: recipient);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                  ),
                  child: Text(
                    'Buy Goods',
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
