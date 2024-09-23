import 'package:flutter/material.dart';

// Defining the SendMoneyPage class
class SendMoneyPage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController recipientController = TextEditingController(); // Controller for recipient's number input
  final TextEditingController amountController = TextEditingController(); // Controller for amount input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Money'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            // Input field for recipient's number
            TextField(
              controller: recipientController, // Connect the controller to the input field
              decoration: InputDecoration(
                labelText: 'Recipient\'s Number', // Label displayed in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
              keyboardType: TextInputType.phone, // Show numeric keyboard for phone number input
            ),
            SizedBox(height: 16.0), // Add space between the fields
            // Input field for amount
            TextField(
              controller: amountController, // Connect the controller to the input field
              decoration: InputDecoration(
                labelText: 'Amount', // Label displayed in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
              keyboardType: TextInputType.number, // Show numeric keyboard for amount input
            ),
            SizedBox(height: 20.0), // Add space between the fields and button
            // Send Money button
            ElevatedButton(
              onPressed: () {
                // Handle send money action when the button is pressed
                String recipient = recipientController.text; // Get the recipient's number from input
                String amount = amountController.text; // Get the amount from input

                // Add your send money logic here (e.g., API call)
                print('Sending $amount to $recipient'); // Debug output to console
                // Optionally show a message or navigate to another page
              },
              child: Text('Send Money'), // Text displayed on the button
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
