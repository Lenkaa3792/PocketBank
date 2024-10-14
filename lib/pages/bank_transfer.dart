import 'package:flutter/material.dart';

class BankTransferPage extends StatefulWidget {
  const BankTransferPage({super.key});

  @override
  _BankTransferPageState createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  // Controllers to manage the input fields
  final TextEditingController recipientNameController =
      TextEditingController(); // Controller for recipient's name input
  final TextEditingController accountNumberController =
      TextEditingController(); // Controller for recipient's account number input
  final TextEditingController amountController =
      TextEditingController(); // Controller for transfer amount input

  // Key for the form to manage validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Transfer'), // Title displayed in the AppBar
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
          padding:
              const EdgeInsets.all(16.0), // Padding around the form content
          child: Form(
            key: _formKey, // Assign the form key to manage form validation
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Center the column's content vertically
              children: [
                // Input field for recipient's name
                TextFormField(
                  controller:
                      recipientNameController, // Connects the controller to manage the recipient's name input
                  decoration: const InputDecoration(
                    labelText:
                        'Recipient\'s Name', // Label for the recipient's name input field
                    border:
                        OutlineInputBorder(), // Outline border around the input field
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the recipient\'s name'; // Error message if field is empty
                    }
                    return null; // No error if the field is valid
                  },
                ),
                const SizedBox(height: 16.0), // Space between the input fields

                // Input field for recipient's account number
                TextFormField(
                  controller:
                      accountNumberController, // Connects the controller to manage the account number input
                  decoration: const InputDecoration(
                    labelText:
                        'Recipient\'s Account Number', // Label for the account number input field
                    border:
                        OutlineInputBorder(), // Outline border around the input field
                  ),
                  keyboardType: TextInputType
                      .number, // Numeric keyboard for entering the account number
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the account number'; // Error message if field is empty
                    }
                    return null; // No error if the field is valid
                  },
                ),
                const SizedBox(height: 16.0), // Space between the input fields

                // Input field for transfer amount
                TextFormField(
                  controller:
                      amountController, // Connects the controller to manage the transfer amount input
                  decoration: const InputDecoration(
                    labelText: 'Amount', // Label for the amount input field
                    border:
                        OutlineInputBorder(), // Outline border around the input field
                  ),
                  keyboardType: TextInputType
                      .number, // Numeric keyboard for entering the amount
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the amount'; // Error message if field is empty
                    }
                    return null; // No error if the field is valid
                  },
                ),
                const SizedBox(
                    height: 20.0), // Space between the input fields and button

                // Transfer button
                ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding with the transfer logic
                    if (_formKey.currentState!.validate()) {
                      // Logic to handle the bank transfer action when the button is pressed
                      String recipientName = recipientNameController
                          .text; // Get the recipient's name from input
                      String accountNumber = accountNumberController
                          .text; // Get the account number from input
                      String amount =
                          amountController.text; // Get the amount from input

                      // Add your bank transfer logic here (e.g., API call)
                      print(
                          'Transferring $amount to $recipientName (Account: $accountNumber)'); // Debug output to console
                      // Optionally, show a confirmation message or navigate to another page after the operation
                    }
                  }, // Text displayed on the button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0), // Padding inside the button
                  ),
                  child: Text('Transfer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
