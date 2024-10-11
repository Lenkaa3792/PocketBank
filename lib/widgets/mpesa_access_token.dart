import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String generateTimestamp() {
  final now = DateTime.now();
  return DateFormat('yyyyMMddHHmmss').format(now);
}

String? formatPhoneNumber(String phoneNumber) {
  // Remove any whitespace or other characters
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\s+'), '');

  // Check if the number starts with '0' and replace it with '254'
  if (phoneNumber.startsWith('0')) {
    phoneNumber = '254${phoneNumber.substring(1)}';
  } else if (!phoneNumber.startsWith('254')) {
    return null; // Invalid format
  }

  return phoneNumber; // Return the formatted number
}

Future<String?> getMpesaAccessToken() async {
  // Your Consumer Key and Secret
  String consumerKey = 'AcHZUG5W4IcLmtLHZ2w94biCZUGDftmVGM864x44Apw8oN8e';
  String consumerSecret =
      'mdXkQpGf1LXm8HOCBb5HhZyhdCYDFDQZ9yJ1QFRoA9CqyfyPfLeZprKAsAwi7hQK';

  // Encode consumerKey:consumerSecret to base64
  String credentials =
      base64Encode(utf8.encode('$consumerKey:$consumerSecret'));

  // URL for generating access token
  String url =
      'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';

  // Sending request to the OAuth URL
  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Basic $credentials',
    },
  );

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    return body['access_token'];
  } else {
    print('Failed to get access token: ${response.body}');
    return null;
  }
}

Future<void> initiateMpesaSTKPush({
  required String accessToken,
  required String recipient,
  required String amount,
}) async {
  String url =
      'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
  String shortCode = '174379'; // Replace with your actual shortcode
  String passKey = 'bfb279f9aa9bdbcf158e97dd71a467cd'; // Sandbox Passkey
  String timestamp = generateTimestamp(); // Get the current timestamp
  String password = base64Encode(utf8.encode('$shortCode$passKey$timestamp'));

  var body = {
    "BusinessShortCode": shortCode,
    "Password": password,
    "Timestamp": timestamp,
    "TransactionType": "CustomerPayBillOnline",
    "Amount": double.parse(amount),
    "PartyA": "254700000000",
    "PartyB": shortCode,
    "PhoneNumber": recipient,
    "CallBackURL": "https://example.com/callback",
    "AccountReference": "Test123",
    "TransactionDesc": "Payment description",
  };
  print('Making request to M-Pesa with payload: $body'); // Debugging output

  var response = await http.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    print('STK Push initiated: ${response.body}');
  } else {
    print('Failed to initiate STK Push: ${response.body}');
  }

  print('Access Token: $accessToken');
  print('Password: $password');
  print('Timestamp: $timestamp');
}
