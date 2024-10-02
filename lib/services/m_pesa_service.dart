import 'package:dart_mpesa/dart_mpesa.dart';

class MpesaService {
  final Mpesa _mpesa;

  MpesaService()
      : _mpesa = Mpesa(
          shortCode: "YOUR_SHORT_CODE",
          consumerKey: "YOUR_CONSUMER_KEY",
          consumerSecret: "YOUR_CONSUMER_SECRET",
          initiatorName: "YOUR_INITIATOR_NAME",
          securityCredential: "YOUR_SECURITY_CREDENTIAL",
          passKey: "YOUR_PASS_KEY",
          identifierType: IdentifierType.OrganizationShortCode,
          applicationMode: ApplicationMode.test, // Change to live for production
        );

  Future<void> lipaNaMpesaOnline(String phoneNumber, double amount) async {
    try {
      MpesaResponse res = await _mpesa.lipanaMpesaOnline(
        phoneNumber: phoneNumber,
        amount: amount,
        accountReference: "YOUR_ACCOUNT_REFERENCE",
        transactionDesc: "YOUR_TRANSACTION_DESC",
        callBackURL: "YOUR_CALLBACK_URL",
      );

      print('Status Code: ${res.statusCode}');
      print('Raw Response: ${res.rawResponse}');
      print('Response Description: ${res.responseDescription}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
