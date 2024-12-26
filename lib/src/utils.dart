import 'dart:convert';
import 'dart_pure.dart' if (dart.library.ui) 'dart_flutter.dart';
import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';

/// A utility class that provides various helper functions for the application.
class Utils {
  /// Encodes the provided [key] to create a Basic Authentication header.
  static String base64encodeString(String key) {
    // Base64 encode the  key
    String encodedKey = base64Encode(utf8.encode(key));

    // Create the auth header value
    return encodedKey;
  }

  static void isFrontEndEnvironment() {
    if (!kIsPureDart) {
      throw OmiseApiException(
          message: OmiseApiErrors
              .secretKeyMustNotBeUsedInFrontendEnvironments.message);
    }
  }
}
