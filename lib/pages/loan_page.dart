import 'package:flutter/material.dart';

class LoanPage extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Overview'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Current Loan Balance: \$5,000',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Total Loan Amount: \$10,000',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Interest Rate: 5%',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Payment Schedule: Monthly',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Apply for a Loan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Enter Loan Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle loan application logic
                final amount = _amountController.text;
                _showLoanConfirmation(context, amount); // Show confirmation dialog
              },
              child: Text('Apply for Loan'), // Button text
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal), // Button color
            ),
            SizedBox(height: 20),
            Text(
              'Loan History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Dummy data for loan history
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Loan Application - \$2,000'),
                    subtitle: Text('Status: Approved'),
                  ),
                  ListTile(
                    title: Text('Loan Application - \$1,000'),
                    subtitle: Text('Status: Pending'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoanConfirmation(BuildContext context, String amount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Loan Application'),
          content: Text('You have applied for a loan of \$${amount}.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
