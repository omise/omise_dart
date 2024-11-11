import 'dart:convert';

import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/models/requests/create_token_request.dart';
import 'package:omise_dart/src/models/responses/omise_api_error.dart';
import 'package:omise_dart/src/models/responses/token.dart';
import 'package:omise_dart/src/omise_http_client.dart';

/// Provides methods for interacting with the token endpoints of the Omise API.
class TokensApi {
  /// Creates an instance of [TokensApi] with the provided [OmiseHttpClient].
  ///
  /// The [OmiseHttpClient] is used to make HTTP requests to the Omise API.
  ///
  /// The base URL for the tokens endpoint is set to the vault API URL.
  TokensApi(this.httpClient);

  final OmiseHttpClient httpClient;

  /// Creates a new token using the provided [createTokenRequest].
  ///
  /// Sends a POST request to the '/tokens' endpoint with the token creation request data.
  ///
  /// Returns a [Token] if the request is successful (HTTP status code 200).
  ///
  /// Throws an [OmiseApiException] if the request fails. The exception includes
  /// the error message and status code, along with the response from the API.
  Future<Token> create(CreateTokenRequest createTokenRequest) async {
    final response = await httpClient.post(
      '/tokens',
      body: {'card': createTokenRequest.toJson()},
    );
    final decodedBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Token.fromJson(
        decodedBody,
      );
    }

    throw OmiseApiException(
      message: OmiseApiErrors.unableToCreateToken.message,
      statusCode: response.statusCode,
      response: OmiseApiError.fromJson(decodedBody),
    );
  }

  /// Retrieves a token by its [tokenId].
  ///
  /// Sends a GET request to the '/tokens/{tokenId}' endpoint.
  ///
  /// Returns a [Token] if the request is successful (HTTP status code 200).
  ///
  /// Throws an [OmiseApiException] if the request fails. The exception includes
  /// the error message and status code, along with the response from the API.
  Future<Token> get(String tokenId) async {
    final response = await httpClient.get(
      '/tokens/$tokenId',
    );
    final decodedBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Token.fromJson(
        decodedBody,
      );
    }

    throw OmiseApiException(
      message: OmiseApiErrors.unableToGetToken.message,
      statusCode: response.statusCode,
      response: OmiseApiError.fromJson(decodedBody),
    );
  }
}
