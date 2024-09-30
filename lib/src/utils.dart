import 'dart:convert';

/// A utility class that provides various helper functions for the application.
class Utils {
  /// Encodes the provided [key] to create a Basic Authentication header.
  static String base64encodeString(String key) {
    // Base64 encode the  key
    String encodedKey = base64Encode(utf8.encode(key));

    // Create the auth header value
    return encodedKey;
  }
}
