import 'package:flutter/material.dart';

// Defining the BankTransferPage class
class BankTransferPage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController recipientNameController = TextEditingController(); // Controller for recipient's name input
  final TextEditingController accountNumberController = TextEditingController(); // Controller for recipient's account number input
  final TextEditingController amountController = TextEditingController(); // Controller for transfer amount input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Transfer'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the form content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column's content vertically
          children: [
            // Input field for recipient's name
            TextField(
              controller: recipientNameController, // Connects the controller to manage the recipient's name input
              decoration: InputDecoration(
                labelText: 'Recipient\'s Name', // Label for the recipient's name input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
            ),
            SizedBox(height: 16.0), // Space between the input fields

            // Input field for recipient's account number
            TextField(
              controller: accountNumberController, // Connects the controller to manage the account number input
              decoration: InputDecoration(
                labelText: 'Recipient\'s Account Number', // Label for the account number input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering the account number
            ),
            SizedBox(height: 16.0), // Space between the input fields

            // Input field for transfer amount
            TextField(
              controller: amountController, // Connects the controller to manage the transfer amount input
              decoration: InputDecoration(
                labelText: 'Amount', // Label for the amount input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering the amount
            ),
            SizedBox(height: 20.0), // Space between the input fields and button

            // Transfer button
            ElevatedButton(
              onPressed: () {
                // Logic to handle the bank transfer action when the button is pressed
                String recipientName = recipientNameController.text; // Get the recipient's name from input
                String accountNumber = accountNumberController.text; // Get the account number from input
                String amount = amountController.text; // Get the amount from input

                // Add your bank transfer logic here (e.g., API call)
                print('Transferring $amount to $recipientName (Account: $accountNumber)'); // Debug output to console
                // Optionally, show a confirmation message or navigate to another page after the operation
              },
              child: Text('Transfer'), // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Background color of the button
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding inside the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
