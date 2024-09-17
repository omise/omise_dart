import 'package:omise_dart/omise_dart.dart';

Future<void> main() async {
  final omiseApi = OmiseApi(
      publicKey: "test_pkey", secretKey: "test_skey", enableDebug: true);
  final token = await omiseApi.tokens.create(CreateTokenRequest(
      name: "Anas",
      number: "4242424242424242",
      expirationMonth: "09",
      expirationYear: "27"));

  await omiseApi.tokens.get(token.id);
}
