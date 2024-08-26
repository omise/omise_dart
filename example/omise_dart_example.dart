import 'package:omise_dart/omise_dart.dart';

Future<void> main() async {
  var omiseHttpClient = OmiseHttpClient(
      publicKey: "YOUR_PUBLIC_KEY",
      secretKey: "YOUR_SECRET_KEY",
      enableDebug: true);
  await omiseHttpClient.post("/charges");
  return;
}
