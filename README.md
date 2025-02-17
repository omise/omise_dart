# omise_dart

**omise_dart** is a Dart package for integrating Omise's payment API. It provides a simple and intuitive interface to handle transactions, charge creation, and other payment-related activities in Dart and Flutter applications.

## Features

- Easily interact with Omise's API in Dart and Flutter.
- Support for tokenization.
- Support for source creation.
- Built-in error handling for common API issues.

## Getting Started

To use the package, first add it to your project by including the following in your `pubspec.yaml`:

```yaml
dependencies:
  omise_dart: ^0.4.0
```

Then, run:

```bash
flutter pub get
```

Or if you are working with a Dart-only project:

```bash
dart pub get
```

You will also need an Omise account and your public/private keys, which you can obtain by signing up at [Omise Dashboard](https://dashboard.omise.co).

## Usage

Here's a quick example of how to create a token using **omise_dart**:

```dart
import 'package:omise_dart/omise_dart.dart';

void main() async {
  // Initialize the Omise API with your public and secret keys
  final omiseApi = OmiseApi(
    publicKey:
        "p_key", // Replace with your actual public key
    secretKey:
        "s_key", // Replace with your actual secret key
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
}
```

For more detailed examples, including how to get account capabilities, check the [example](example/) folder.

## Example

In the `example/` folder, you will find more comprehensive examples showing various use cases, such as:

- Creating a token
- Fetching a token
- Fetching capability object.

To run the examples:

1. Clone the repository.
2. Run the Dart example using:

```bash
dart run example/omise_dart_example.dart
```

## Documentation

Complete API documentation is available at [pub.dev documentation](https://pub.dev/documentation/omise_dart/latest).

For the Omise API documentation, refer to the official [Omise API docs](https://www.omise.co/docs).

## Contributing

We welcome contributions! Please follow these steps to contribute:

1. Fork this repository.
2. Create a feature branch: `git checkout -b my-feature`.
3. Commit your changes: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin my-feature`.
5. Open a pull request.

For bugs or feature requests, please [create an issue](https://github.com/omise/omise_dart/issues).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
