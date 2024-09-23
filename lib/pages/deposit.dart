import 'package:flutter/material.dart';

// Defining the DepositPage class
class DepositPage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController amountController = TextEditingController(); // Controller for deposit amount input
  final String depositMethod = "Bank Account"; // Placeholder for deposit method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            // Input field for deposit amount
            TextField(
              controller: amountController, // Connect the controller to the input field
              decoration: InputDecoration(
                labelText: 'Deposit Amount', // Label displayed in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
              keyboardType: TextInputType.number, // Show numeric keyboard for amount input
            ),
            SizedBox(height: 16.0), // Add space between the fields
            // Deposit method selection (for simplicity, using a placeholder)
            DropdownButtonFormField<String>(
              value: depositMethod,
              decoration: InputDecoration(
                labelText: 'Deposit Method', // Label displayed in the dropdown
                border: OutlineInputBorder(), // Outline border style for the dropdown
              ),
              items: [
                DropdownMenuItem<String>(
                  value: 'Bank Account',
                  child: Text('Bank Account'), // Option for deposit method
                ),
                DropdownMenuItem<String>(
                  value: 'Debit/Credit Card',
                  child: Text('Debit/Credit Card'), // Option for deposit method
                ),
                // Add more methods as needed
              ],
              onChanged: (String? newValue) {
                // Handle method change if needed
              },
            ),
            SizedBox(height: 20.0), // Add space between the fields and button
            // Deposit button
            ElevatedButton(
              onPressed: () {
                // Handle deposit action when the button is pressed
                String amount = amountController.text; // Get the amount from input

                // Add your deposit logic here (e.g., API call)
                print('Depositing $amount via $depositMethod'); // Debug output to console
                // Optionally show a message or navigate to another page
              },
              child: Text('Deposit'), // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Background color of the button
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding for the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
