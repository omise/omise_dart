import 'package:omise_dart/src/omise_http_client.dart';
import 'package:omise_dart/src/services/capability_api.dart';
import 'package:omise_dart/src/services/sources_api.dart';
import 'package:omise_dart/src/services/tokens_api.dart';
import 'package:omise_dart/src/utils.dart';

/// A main entry point for interacting with the Omise API.
///
/// The [OmiseApi] class provides a convenient way to access various Omise
/// API endpoints, including the [TokensApi]. This class is designed to handle
/// the configuration of the HTTP client used to communicate with the Omise API.
class OmiseApi {
  /// Creates an instance of [OmiseApi] and initializes the necessary HTTP client.
  ///
  /// The constructor accepts optional parameters:
  /// - [publicKey]: Your public API key for accessing the Omise API.
  /// - [secretKey]: Your secret API key for accessing the Omise API.
  /// - [enableDebug]: A boolean to enable debug logging (optional).
  /// - [ignoreNullKeys]: A boolean to ignore null values when sending API requests (optional).
  /// - [userAgent]: A custom user agent string to identify the client (optional).
  ///
  /// These parameters are passed to the [OmiseHttpClient], which is used by
  /// [TokensApi] for making HTTP requests.
  ///
  /// Example usage:
  /// ```dart
  /// final omiseApi = OmiseApi(publicKey: 'your-public-key', secretKey: 'your-secret-key');
  /// ```
  OmiseApi({
    String? publicKey,
    String? secretKey,
    bool? enableDebug,
    bool? ignoreNullKeys,
    String? userAgent,
  }) {
    if (secretKey != null) {
      Utils.isFrontEndEnvironment();
    }
    // Create the HTTP client using the provided parameters
    final OmiseHttpClient omiseHttpClient = OmiseHttpClient(
      publicKey: publicKey,
      secretKey: secretKey,
      enableDebug: enableDebug,
      ignoreNullKeys: ignoreNullKeys,
      userAgent: userAgent,
    );

    // Initialize the APIs
    tokens = TokensApi(omiseHttpClient);
    capability = CapabilityApi(omiseHttpClient);
    sources = SourcesApi(omiseHttpClient);
  }

  /// Provides access to the [TokensApi], which includes methods for creating and retrieving tokens.
  late TokensApi tokens;

  /// Provides access to the [CapabilityApi], which includes methods for retrieving the capabilities of an account.
  late CapabilityApi capability;

  /// Provides access to the [SourcesApi], which includes methods for creating and retrieving sources.
  late SourcesApi sources;
}
