import 'package:flutter/material.dart';

// Defining the PayBillsPage class, which is a StatelessWidget
class PayBillsPage extends StatefulWidget {

  const PayBillsPage({super.key}); 
  @override
  State<PayBillsPage> createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  // Controller to handle input for the bill number
  final TextEditingController billNumberController = TextEditingController();

  // Controller to handle input for the account number
  final TextEditingController accountNumberController = TextEditingController();

  // Controller to handle input for the amount
  final TextEditingController amountController = TextEditingController();

  // List of available bill types for the dropdown menu
  final List<String> billTypes = ['DSTV', 'Water', 'Netflix', 'Showmax'];

  // Variable to store the currently selected bill type
  String selectedBillType = 'DSTV';

 // Default selection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'), // Title displayed in the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            // Dropdown button for selecting the type of bill
            DropdownButton<String>(
              value: selectedBillType, // Current selected bill type
              onChanged: (String? newValue) {
                // Update selected bill type when a new value is chosen
                selectedBillType = newValue!;
              },
              items: billTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value, // The value for the dropdown item
                  child: Row(
                    children: [
                      // Placeholder icon for each bill type (replace with actual icons)
                      const Icon(Icons.receipt, size: 24), // Icon for the bill type
                      const SizedBox(width: 8), // Space between icon and text
                      Text(value), // Display the bill type text
                    ],
                  ),
                );
              }).toList(), // Convert the list of bill types to dropdown items
            ),
            const SizedBox(height: 16.0), // Space between the dropdown and input fields
            
            // Input field for entering the bill number
            TextField(
              controller: billNumberController, // Connects the controller to the input field
              decoration: const InputDecoration(
                labelText: 'Bill Number', // Label shown in the input field
                border: OutlineInputBorder(), // Outline border for the input field
              ),
            ),
            const SizedBox(height: 16.0), // Space between input fields
            
            // Input field for entering the account number
            TextField(
              controller: accountNumberController, // Connects the controller to the input field
              decoration: const InputDecoration(
                labelText: 'Account Number', // Label shown in the input field
                border: OutlineInputBorder(), // Outline border for the input field
              ),
            ),
            const SizedBox(height: 16.0), // Space between input fields
            
            // Input field for entering the amount to pay
            TextField(
              controller: amountController, // Connects the controller to the input field
              keyboardType: TextInputType.number, // Show numeric keyboard for input
              decoration: const InputDecoration(
                labelText: 'Amount', // Label shown in the input field
                border: OutlineInputBorder(), // Outline border for the input field
              ),
            ),
            const SizedBox(height: 20.0), // Space between input fields and button
            
            // Button to trigger the payment action
            ElevatedButton(
              onPressed: () {
                // Logic to handle payment would go here
                final billNumber = billNumberController.text;
                final accountNumber = accountNumberController.text;
                final amount = amountController.text;

                // Show a message with the payment details (for demonstration)
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Payment Confirmation'),
                      content: Text('Paying $amount for $selectedBillType\nBill Number: $billNumber\nAccount Number: $accountNumber'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('OK'), // Button text
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Send Payment'), // Button label
            ),
          ],
        ),
      ),
    );
  }
}
