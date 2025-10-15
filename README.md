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
  omise_dart: ^0.7.0
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

### Note on Amount

When specifying the `amount` in payment requests, ensure that you follow Omise's subunits convention. The amount should be in the smallest currency unit (e.g., satangs for THB, cents for USD).

For more details, refer to the [Omise API documentation on subunits](https://docs.omise.co/currency-and-amount).

For more detailed examples, including how to get account capabilities, check the [example](example/) folder.

# Passkey Integration

The `omise_dart` SDK supports Passkey authentication for enhanced security and user experience. Passkey provides a passwordless authentication method that uses biometric authentication or device PINs, making payments more secure and convenient for users.

## Prerequisites

Before implementing Passkey authentication:

- Ensure your Omise account supports Passkey authentication
- Configure your frontend to collect proper card holder data (email/phoneNumber)

## Implementation

### Requesting Cardholder Data

To use Passkey authentication, you must request cardholder data fields (email or phone number) during the payment process on the frontend. This information is required for the backend Passkey authentication setup.

### Creating a Passkey Charge

Once you have created a token on the frontend that includes the email/phoneNumber of the user, you can now use this token to create a passkey charge.
To create a passkey charge you must set the `authentication` field in the charge request to `passKey`. This will trigger the required flows and you will also be able to check the `authenticatedBy` field in the charge response in order to check the actual authentication method. Here is an example code for creating a charge with the passkey flow:

```dart
final charge = await omiseApi.charges.create(
    CreateChargeRequest(
      amount: 2000,
      currency: Currency.thb,
      card: token.id,
      returnUri: 'https://example.com/return',
      authentication: AuthenticationType.passKey,
    ),
  );
```

## Example

In the `example/` folder, you will find more comprehensive examples showing various use cases, such as:

- Creating a token
- Fetching a token
- Creating a charge
- Fetching a charge
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
