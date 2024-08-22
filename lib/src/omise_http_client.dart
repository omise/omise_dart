import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:omise_dart/src/enums/api_version.dart';
import 'package:omise_dart/src/enums/environment.dart';
import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/utils.dart';

/// A simple HTTP client for interacting with the Omise API.
///
/// The [OmiseHttpClient] class provides methods for making GET, POST, and PATCH
/// requests to the Omise API. It automatically handles the necessary headers,
/// including the API version, public key, and user agent.
///
/// The client requires a valid public or secret key and throws an [OmiseApiException]
/// if both are invalid.
class OmiseHttpClient {
  /// Creates an instance of [OmiseHttpClient].
  ///
  /// If the [publicKey] and [secretKey] are both empty, an [OmiseApiException]
  /// is thrown. The [httpClient] is used to make HTTP requests. If not provided,
  /// a default [http.Client] is used.
  OmiseHttpClient({
    required this.publicKey,
    required this.secretKey,
    this.userAgent,
    http.Client? httpClient,
    this.enableDebug = false,
  }) : _httpClient = httpClient ?? http.Client() {
    if (publicKey.isEmpty && secretKey.isEmpty) {
      throw OmiseApiException(
        message: OmiseApiErrors.bothKeysAreInvalid.message,
      );
    }
  }

  /// For testing purposes and passing custom client
  final http.Client _httpClient;

  /// The base URL for the Omise API.
  String baseUrl = Environment.baseUrl.value;

  /// The version of the Omise API to use.
  String apiVersion = ApiVersion.version2019.value;

  /// The user agent string to include in requests.
  final String? userAgent;

  /// The public key used for authenticating with the Omise API.
  final String publicKey;

  /// The secret key used for authenticating with the Omise API.
  final String secretKey;

  /// Wether to print all the api responses or not
  final bool? enableDebug;

  /// Retrieves a user agent string that includes the Dart SDK version, the SDK package information,
  /// and the operating system details.
  ///
  /// The user agent string follows the format:
  /// `dart/<DartSDKVersion> package:<PackageName> sdkVersion:<PackageVersion> (<OperatingSystem> <OSVersion>)`
  ///
  /// For example, it might return:
  /// `dart/3.5.0 (stable) (Tue Jul 30 02:17:59 2024 -0700) on "macos_arm64" package:omise_dart sdkVersion:1.0.0 (macos Version 14.6.1 (Build 23G93))`
  ///
  /// This function is useful for tracking the environment and SDK version in which your application
  /// is running, often needed for analytics, logging, or debugging.
  ///
  /// Returns:
  ///   A [Future<String>] containing the user agent string.
  ///
  /// Throws:
  ///   An [Exception] if package information cannot be retrieved.
  Future<String> getUserAgent() async {
    if (userAgent != null) {
      return userAgent!;
    }
    final packageInfo = await Utils.getPackageInfo();
    final sdkVersion = packageInfo['version']!;
    final packageName = packageInfo['name']!;
    return 'dart/${Platform.version} package:$packageName sdkVersion:$sdkVersion (${Platform.operatingSystem} ${Platform.operatingSystemVersion})';
  }

  /// Returns the HTTP headers required for Omise API requests.
  Future<Map<String, String>> getHeaders() async {
    final userAgent = await getUserAgent();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $publicKey',
      'User-Agent': userAgent,
      'Omise-Version': apiVersion,
    };
  }

  /// Sends a GET request to the specified [path] relative to the [baseUrl].
  ///
  /// Returns an [http.Response] object containing the server's response.
  Future<http.Response> get(String path) async {
    final headers = await getHeaders();
    final response = await _httpClient.get(
      Uri.parse('$baseUrl$path'),
      headers: headers,
    );
    if (enableDebug == true) {
      print(response.body);
    }
    return response;
  }

  /// Sends a POST request to the specified [path] relative to the [baseUrl].
  ///
  /// The optional [body] parameter can be used to send data in JSON format.
  /// Returns an [http.Response] object containing the server's response.
  Future<http.Response> post(String path, {Map<String, dynamic>? body}) async {
    final headers = await getHeaders();
    final jsonBody = body != null ? jsonEncode(body) : null;
    final response = await _httpClient.post(
      Uri.parse('$baseUrl$path'),
      body: jsonBody,
      headers: headers,
    );
    if (enableDebug == true) {
      print(response.body);
    }
    return response;
  }

  /// Sends a PATCH request to the specified [path] relative to the [baseUrl].
  ///
  /// The optional [body] parameter can be used to send data in JSON format.
  /// Returns an [http.Response] object containing the server's response.
  Future<http.Response> patch(String path, {Map<String, dynamic>? body}) async {
    final headers = await getHeaders();
    final jsonBody = body != null ? jsonEncode(body) : null;
    final response = await _httpClient.patch(
      Uri.parse('$baseUrl$path'),
      body: jsonBody,
      headers: headers,
    );
    if (enableDebug == true) {
      print(response.body);
    }
    return response;
  }
}
