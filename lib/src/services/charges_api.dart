import 'dart:convert';

import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/models/requests/create_charge_request.dart';
import 'package:omise_dart/src/models/responses/charge.dart';
import 'package:omise_dart/src/models/responses/omise_api_error.dart';
import 'package:omise_dart/src/omise_http_client.dart';

/// Provides methods for interacting with the charge endpoints of the Omise API.
class ChargesApi {
  /// Creates an instance of [ChargesApi] with the provided [OmiseHttpClient].
  ///
  /// The [OmiseHttpClient] is used to make HTTP requests to the Omise API.
  ChargesApi(this.httpClient);

  final OmiseHttpClient httpClient;

  /// Creates a new charge using the provided [createChargeRequest].
  ///
  /// Sends a POST request to the '/charges' endpoint with the charge creation request data.
  ///
  /// Returns a [Charge] if the request is successful (HTTP status code 200).
  ///
  /// Throws an [OmiseApiException] if the request fails. The exception includes
  /// the error message and status code, along with the response from the API.
  Future<Charge> create(CreateChargeRequest createChargeRequest) async {
    final response = await httpClient.post(
      '/charges',
      body: createChargeRequest.toJson(),
    );
    final decodedBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Charge.fromJson(
        decodedBody,
      );
    }

    throw OmiseApiException(
      message: OmiseApiErrors.unableToCreateCharge.message,
      statusCode: response.statusCode,
      response: OmiseApiError.fromJson(decodedBody),
    );
  }

  /// Retrieves a charge by its [chargeId].
  ///
  /// Sends a GET request to the '/charges/{chargeId}' endpoint.
  ///
  /// Returns a [Charge] if the request is successful (HTTP status code 200).
  ///
  /// Throws an [OmiseApiException] if the request fails. The exception includes
  /// the error message and status code, along with the response from the API.
  Future<Charge> get(String chargeId) async {
    final response = await httpClient.get(
      '/charges/$chargeId',
    );
    final decodedBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Charge.fromJson(
        decodedBody,
      );
    }
    throw OmiseApiException(
      message: OmiseApiErrors.unableToGetCharge.message,
      statusCode: response.statusCode,
      response: OmiseApiError.fromJson(decodedBody),
    );
  }
}
