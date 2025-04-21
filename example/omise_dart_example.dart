import 'package:omise_dart/omise_dart.dart';

Future<void> main() async {
  // Initialize the Omise API with your public and secret keys
  final omiseApi = OmiseApi(
    publicKey: "your_public_key_here", // Replace with your actual public key
    secretKey: "your_secret_key_here", // Replace with your actual secret key
    enableDebug: false, // Enables debug logging
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

  // Create a source
  final createSourceRequest = CreateSourceRequest(
      name: "Name",
      amount: 2000,
      currency: Currency.thb,
      type: PaymentMethodName.promptpay);

  // Call the Omise API to create a source
  final source = await omiseApi.sources.create(createSourceRequest);

  print('Source created: ${source.id}');

  // Retrieve token information using the token ID
  final retrievedSource = await omiseApi.sources.get(source.id);

  print('Source retrieved: ${retrievedSource.id}');

  // Fetch capability information from the Omise API
  final capability = await omiseApi.capability.get();

  print('Capability retrieved: ${capability.country}');

  final charge = await omiseApi.charges.create(CreateChargeRequest(
      amount: 2000, currency: Currency.thb, source: source.id));
  print("Charge created: ${charge.id}");

  final retrievedCharge = await omiseApi.charges.get(charge.id);

  print('Charge retrieved: ${retrievedCharge.id}');
}
