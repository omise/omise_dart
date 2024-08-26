import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as path;

/// A utility class that provides various helper functions for the application.
class Utils {
  /// Retrieves package information (name and version) from the `pubspec.yaml` file.
  ///
  /// This method reads the `pubspec.yaml` file located in the current working directory
  /// and extracts the package name and version.
  ///
  /// Returns:
  ///   A [Future<Map<String, String>>] that resolves to a map containing:
  ///     - `'name'`: The name of the package.
  ///     - `'version'`: The version of the package.
  ///
  /// Throws:
  ///   [OmiseApiException] if the `pubspec.yaml` file does not exist, version or name not found in `pubspec.yaml`
  static Future<Map<String, String>> getPackageInfo() async {
    // Construct the path to the `pubspec.yaml` file in the current directory.
    final pubspecPath = path.join(Directory.current.path, 'pubspec.yaml');
    final pubspecFile = File(pubspecPath);

    // Check if the file exists.
    if (!await pubspecFile.exists()) {
      throw OmiseApiException(
          message: OmiseApiErrors.pubSpecFileNotFound.message);
    }

    // Read the content of the `pubspec.yaml` file.
    final pubspecContent = await pubspecFile.readAsString();

    // Parse the YAML content.
    final pubspec = loadYaml(pubspecContent);

    // Ensure the YAML data contains the 'version' key.
    if (pubspec == null || !pubspec.containsKey('version')) {
      throw OmiseApiException(message: OmiseApiErrors.versionNotFound.message);
    }
    // Ensure the YAML data contains the 'name' key.
    if (pubspec == null || !pubspec.containsKey('name')) {
      throw OmiseApiException(message: OmiseApiErrors.nameNotFound.message);
    }

    // Extract package name and version from the YAML data.
    final packageName = pubspec['name'] as String;
    final packageVersion = pubspec['version'] as String;

    // Return the package information as a map.
    return {
      'name': packageName,
      'version': packageVersion,
    };
  }

  /// Encodes the provided [key] to create a Basic Authentication header.
  static String base64encodeString(String key) {
    // Base64 encode the  key
    String encodedKey = base64Encode(utf8.encode(key));

    // Create the auth header value
    return encodedKey;
  }
}
