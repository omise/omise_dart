import 'package:omise_dart/omise_dart.dart';

Future<void> main() async {
  // Initialize the Omise API with your public and secret keys
  final omiseApi = OmiseApi(
    publicKey:
        "pkey_test_5tnt1gxjf6ecypmkfi8", // Replace with your actual public key
    secretKey: "your_secret_key_here", // Replace with your actual secret key
    enableDebug: true, // Enables debug logging
  );

  // Create a token using card details
  final createTokenRequest = CreateTokenRequest(
    name: "Name",
    number: "4242424242424242", // Example test card number
    expirationMonth: "09", // Card expiry month
    expirationYear: "27", // Card expiry year
  );

  // Call the Omise API to create a token
  final token = await omiseApi.tokens.create(createTokenRequest);

  print('Token created: ${token.id}');

  // Retrieve token information using the token ID
  final retrievedToken = await omiseApi.tokens.get(token.id);

  print('Token retrieved: ${retrievedToken.id}');

  // Fetch capability information from the Omise API
  final capability = await omiseApi.capability.get();

  print('Capability retrieved: ${capability.country}');
}
