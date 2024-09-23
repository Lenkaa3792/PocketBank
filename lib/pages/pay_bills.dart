import 'package:flutter/material.dart'; // Import Flutter Material package for UI components

// Defining the PayBillsPage class
class PayBillsPage extends StatelessWidget {
  // Controller for the bill number input field
  final TextEditingController billNumberController = TextEditingController();
  // Controller for the account number input field
  final TextEditingController accountNumberController = TextEditingController();

  // List of bill types available for selection
  final List<String> billTypes = ['DSTV', 'Water', 'Netflix', 'Showmax'];

  // Variable to store the currently selected bill type
  String selectedBillType = 'DSTV'; // Default selection is DSTV

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides a structure for the page, including an AppBar and body
      appBar: AppBar(
        title: Text('Pay Bills'), // Title displayed in the AppBar
      ),
      body: Padding(
        // Padding adds space around the content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            // Dropdown button for selecting the bill type
            DropdownButton<String>(
              value: selectedBillType, // Currently selected bill type
              onChanged: (String? newValue) {
                // Update the selected bill type when a new option is selected
                selectedBillType = newValue!;
              },
              items: billTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      // Placeholder icon for the bill type (replace with actual icons)
                      Icon(Icons.receipt, size: 24), // Icon representing the bill type
                      SizedBox(width: 8), // Space between icon and text
                      Text(value), // Display the bill type name
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0), // Add space between the dropdown and input fields
            // Input field for the bill number
            TextField(
              controller: billNumberController, // Connect the controller to the input field
              decoration: InputDecoration(
                labelText: 'Bill Number', // Label shown in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
            ),
            SizedBox(height: 16.0), // Add space between the fields
            // Input field for the account number
            TextField(
              controller: accountNumberController, // Connect the controller to the input field
              decoration: InputDecoration(
                labelText: 'Account Number', // Label shown in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
            ),
            SizedBox(height: 20.0), // Add space between the fields and button
            // Button to initiate the payment process
            ElevatedButton(
              onPressed: () {
                // Action to perform when the button is pressed
                String billNumber = billNumberController.text; // Get the bill number from the input field
                String accountNumber = accountNumberController.text; // Get the account number from the input field

                // Print details to the console (for debugging purposes)
                print('Paying $selectedBillType with bill number $billNumber from account $accountNumber');
                // Here you would add your logic to process the payment, e.g., API call
              },
              child: Text('Pay Bill'), // Text displayed on the button
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
