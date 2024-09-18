import 'dart:convert';
import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/models/responses/capability.dart';
import 'package:omise_dart/src/models/responses/omise_api_error.dart';
import 'package:omise_dart/src/omise_http_client.dart';

/// Provides methods for interacting with the capability endpoint of the Omise API.
class CapabilityApi {
  /// Creates an instance of [CapabilityApi] with the provided [OmiseHttpClient].
  ///
  /// The [OmiseHttpClient] is used to make HTTP requests to the Omise API.
  ///
  CapabilityApi(this.httpClient);

  final OmiseHttpClient httpClient;

  /// Retrieves the capabilities of the user.
  ///
  /// Sends a GET request to the '/capability' endpoint.
  ///
  /// Returns a [Capability] if the request is successful (HTTP status code 200).
  ///
  /// Throws an [OmiseApiException] if the request fails. The exception includes
  /// the error message and status code, along with the response from the API.
  Future<Capability> get() async {
    final response = await httpClient.get(
      '/capability',
    );
    final decodedBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Capability.fromJson(
        decodedBody,
      );
    } else {
      throw OmiseApiException(
        message: OmiseApiErrors.unableToGetCapability.message,
        statusCode: response.statusCode,
        response: OmiseApiError.fromJson(decodedBody),
      );
    }
  }
}
