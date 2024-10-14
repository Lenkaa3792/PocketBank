import 'package:flutter/material.dart';

// Defining the DepositPage class
class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  // Controllers to manage the input fields
  final TextEditingController amountController =
      TextEditingController(); // Controller for deposit amount input
  String? depositMethod =
      "Bank Account"; // Variable to store selected deposit method

  // Key for the form to manage validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'), // Title displayed in the AppBar
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
            key: _formKey, // Form key for managing validation
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the column vertically
              children: [
                // Input field for deposit amount
                TextFormField(
                  controller:
                      amountController, // Connect the controller to the input field
                  decoration: const InputDecoration(
                    labelText:
                        'Deposit Amount', // Label displayed in the input field
                    border:
                        OutlineInputBorder(), // Outline border style for the input field
                  ),
                  keyboardType: TextInputType
                      .number, // Show numeric keyboard for amount input
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a deposit amount'; // Error if the field is empty
                    }
                    return null; // No error if field is valid
                  },
                ),
                const SizedBox(height: 16.0), // Add space between the fields

                // Deposit method selection
                DropdownButtonFormField<String>(
                  value: depositMethod,
                  decoration: const InputDecoration(
                    labelText:
                        'Deposit Method', // Label displayed in the dropdown
                    border:
                        OutlineInputBorder(), // Outline border style for the dropdown
                  ),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Bank Account',
                      child: Text('Bank Account'), // Option for deposit method
                    ),
                    DropdownMenuItem<String>(
                      value: 'Debit/Credit Card',
                      child: Text(
                          'Debit/Credit Card'), // Option for deposit method
                    ),
                    // Add more methods as needed
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      depositMethod =
                          newValue; // Update deposit method selection
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a deposit method'; // Error if no method is selected
                    }
                    return null; // No error if field is valid
                  },
                ),

                const SizedBox(
                    height: 20.0), // Add space between the fields and button

                // Deposit button
                ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding with the deposit logic
                    if (_formKey.currentState!.validate()) {
                      String amount =
                          amountController.text; // Get the amount from input

                      // Add your deposit logic here (e.g., API call)
                      print(
                          'Depositing $amount via $depositMethod'); // Debug output to console
                      // Optionally show a confirmation message or navigate to another page
                    }
                  }, // Text displayed on the button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0), // Padding for the button
                  ),
                  child: Text('Deposit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
