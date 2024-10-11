import 'package:flutter/material.dart';
import 'package:pocket_banking/widgets/mpesa_access_token.dart';

// Defining the SendMoneyPage class
class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  // Controllers to manage the input fields
  final TextEditingController recipientController =
      TextEditingController(); // Controller for recipient's number input
  final TextEditingController amountController =
      TextEditingController(); // Controller for amount input

  // Form key to manage validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'), // Title displayed in the AppBar
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
                        'Recipient\'s Number', // Label displayed in the input field
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
                      String recipient = recipientController.text;
                      String amount = amountController.text;

                      // Format the recipient phone number
                      String? formattedRecipient = formatPhoneNumber(recipient);

                      if (formattedRecipient == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Please enter a valid phone number')),
                        );
                        return; // Exit if the number is invalid
                      }

                      // Get M-Pesa access token
                      String? accessToken = await getMpesaAccessToken();

                      if (accessToken != null) {
                        // Initiate payment
                        await initiateMpesaSTKPush(
                          accessToken: accessToken,
                          recipient: formattedRecipient,
                          amount: amount,
                        );

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Sending $amount to $formattedRecipient'),
                        ));
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Failed to get access token'),
                        ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                  ),
                  child: Text(
                    'Send Money',
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
