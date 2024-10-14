import 'package:flutter/material.dart';

// Defining the PayBillsPage class, which is a StatefulWidget
class PayBillsPage extends StatefulWidget {
  const PayBillsPage({super.key});

  @override
  State<PayBillsPage> createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  // Controllers to handle input for the bill number, account number, and amount
  final TextEditingController billNumberController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // List of available bill types for the dropdown menu
  final List<String> billTypes = ['DSTV', 'Water', 'Netflix', 'Showmax'];

  // Variable to store the currently selected bill type
  String selectedBillType = 'DSTV';

  // Building the widget for PayBillsPage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Pay Bills'), // Title displayed in the AppBar
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
          padding: const EdgeInsets.all(16.0), // Padding around the content
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the column vertically
            children: [
              // Dropdown button for selecting the type of bill
              DropdownButton<String>(
                value: selectedBillType, // Current selected bill type
                onChanged: (String? newValue) {
                  setState(() {
                    // Update selected bill type when a new value is chosen
                    if (newValue != null) {
                      selectedBillType = newValue;

                      // Switch case based on selected bill type
                      switch (selectedBillType) {
                        case 'DSTV':
                          print('DSTV selected');
                          break;
                        case 'Water':
                          print('Water selected');
                          break;
                        case 'Netflix':
                          print('Netflix selected');
                          break;
                        case 'Showmax':
                          print('Showmax selected');
                          break;
                        default:
                          print('Unknown bill type selected');
                      }
                    }
                  });
                },
                items: billTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value, // The value for the dropdown item
                    child: Row(
                      children: [
                        const Icon(Icons.receipt,
                            size: 24), // Placeholder icon for each bill type
                        const SizedBox(width: 8), // Space between icon and text
                        Text(value), // Display the bill type text
                      ],
                    ),
                  );
                }).toList(), // Convert the list of bill types to dropdown items
              ),
              const SizedBox(
                  height: 16.0), // Space between the dropdown and input fields

              // Input field for entering the bill number
              TextField(
                controller:
                    billNumberController, // Connects the controller to the input field
                decoration: const InputDecoration(
                  labelText: 'Bill Number', // Label shown in the input field
                  border:
                      OutlineInputBorder(), // Outline border for the input field
                ),
              ),
              const SizedBox(height: 16.0), // Space between input fields

              // Input field for entering the account number
              TextField(
                controller:
                    accountNumberController, // Connects the controller to the input field
                decoration: const InputDecoration(
                  labelText: 'Account Number', // Label shown in the input field
                  border:
                      OutlineInputBorder(), // Outline border for the input field
                ),
              ),
              const SizedBox(height: 16.0), // Space between input fields

              // Input field for entering the amount to pay
              TextField(
                controller:
                    amountController, // Connects the controller to the input field
                keyboardType:
                    TextInputType.number, // Show numeric keyboard for input
                decoration: const InputDecoration(
                  labelText: 'Amount', // Label shown in the input field
                  border:
                      OutlineInputBorder(), // Outline border for the input field
                ),
              ),
              const SizedBox(
                  height: 20.0), // Space between input fields and button

              // Button to trigger the payment action
              ElevatedButton(
                onPressed: () async {
                  // Logic to handle payment would go here
                  final billNumber = billNumberController.text;
                  final accountNumber = accountNumberController.text;
                  final amount = double.parse(amountController.text);

                  // Show a message with the payment details (for demonstration)
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Payment Confirmation'),
                        content: Text(
                          'Paying $amount for $selectedBillType\n'
                          'Bill Number: $billNumber\n'
                          'Account Number: $accountNumber',
                        ),
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
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white),
                child: const Text('Send Payment'), // Button label
              ),
            ],
          ),
        ),
      ),
    );
  }
}
