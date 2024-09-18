import 'package:omise_dart/omise_dart.dart';

Future<void> main() async {
  // Create a token
  final omiseApi = OmiseApi(
      publicKey: "test_pkey", secretKey: "test_skey", enableDebug: true);
  final token = await omiseApi.tokens.create(CreateTokenRequest(
      name: "Anas",
      number: "4242424242424242",
      expirationMonth: "09",
      expirationYear: "27"));
// GET a token
  await omiseApi.tokens.get(token.id);

  // GET capability
  await omiseApi.capability.get();
}
