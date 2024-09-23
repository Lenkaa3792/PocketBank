import 'package:flutter/material.dart';

class BuyAirtimePage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController numberController = TextEditingController(); // Controller for the phone number input
  final TextEditingController amountController = TextEditingController(); // Controller for the airtime amount input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Airtime'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the form content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the column's content vertically
          children: [
            // Input field for phone number
            TextField(
              controller: numberController, // Connect the controller to manage the phone number input
              decoration: InputDecoration(
                labelText: 'Phone Number', // Label for the phone number input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.phone, // Numeric keyboard for phone number input
            ),
            SizedBox(height: 16.0), // Space between the input fields
            // Input field for airtime amount
            TextField(
              controller: amountController, // Connect the controller to manage the airtime amount input
              decoration: InputDecoration(
                labelText: 'Amount', // Label for the airtime amount input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering amount
            ),
            SizedBox(height: 20.0), // Space between the input fields and the button
            // Buy Airtime button
            ElevatedButton(
              onPressed: () {
                // Logic to handle the buy airtime action when the button is pressed
                String number = numberController.text; // Get the phone number from the input field
                String amount = amountController.text; // Get the airtime amount from the input field

                // Add the buy airtime logic here (e.g., API call)
                print('Buying $amount of airtime for $number'); // Debug output to the console
                // Optionally, you can show a confirmation message or navigate to another page after the operation
              },
              child: Text('Buy Airtime'), // Text displayed on the button
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
