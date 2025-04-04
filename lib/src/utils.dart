import 'dart:convert';
import 'dart:io';
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

  /// Returns the current platform type.
  ///
  /// This function checks if the code is running on Android, iOS, or Web.
  /// If it's running on Android, it returns "Android".
  /// If it's running on iOS, it returns "iOS".
  /// If it's running in a web environment (where dart:io is not available), it returns "Web".
  /// If it's running on any other platform, it returns an empty string.
  static String getPlatform() {
    try {
      if (Platform.isAndroid) return "ANDROID";
      if (Platform.isIOS) return "IOS";
      return '';
    } catch (e) {
      // If dart:io is not available, assume Web
      return "WEB";
    }
  }
}
