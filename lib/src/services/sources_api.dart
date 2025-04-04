import 'dart:convert';

import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/models/requests/create_source_request.dart';
import 'package:omise_dart/src/models/responses/omise_api_error.dart';
import 'package:omise_dart/src/models/responses/source.dart';
import 'package:omise_dart/src/omise_http_client.dart';
import 'package:omise_dart/src/utils.dart';

/// Provides methods for interacting with the source endpoints of the Omise API.
class SourcesApi {
  /// Creates an instance of [SourcesApi] with the provided [OmiseHttpClient].
  ///
  /// The [OmiseHttpClient] is used to make HTTP requests to the Omise API.
  SourcesApi(this.httpClient);

  final OmiseHttpClient httpClient;

  /// Creates a new source using the provided [createSourceRequest].
  ///
  /// Sends a POST request to the '/sources' endpoint with the source creation request data.
  ///
  /// Returns a [Source] if the request is successful (HTTP status code 200).
  ///
  /// Throws an [OmiseApiException] if the request fails. The exception includes
  /// the error message and status code, along with the response from the API.
  Future<Source> create(CreateSourceRequest createSourceRequest) async {
    // set the platform type for all source creation operations, like android, iOS or web
    createSourceRequest.platformType = Utils.getPlatform();

    final response = await httpClient.post(
      '/sources',
      body: createSourceRequest.toJson(),
    );
    final decodedBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Source.fromJson(
        decodedBody,
      );
    }

    throw OmiseApiException(
      message: OmiseApiErrors.unableToCreateSource.message,
      statusCode: response.statusCode,
      response: OmiseApiError.fromJson(decodedBody),
    );
  }

  /// Retrieves a source by its [sourceId].
  ///
  /// Sends a GET request to the '/sources/{sourceId}' endpoint.
  ///
  /// Returns a [Source] if the request is successful (HTTP status code 200).
  ///
  /// Throws an [OmiseApiException] if the request fails. The exception includes
  /// the error message and status code, along with the response from the API.
  Future<Source> get(String sourceId) async {
    final response = await httpClient.get(
      '/sources/$sourceId',
    );
    final decodedBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return Source.fromJson(
        decodedBody,
      );
    }
    throw OmiseApiException(
      message: OmiseApiErrors.unableToGetSource.message,
      statusCode: response.statusCode,
      response: OmiseApiError.fromJson(decodedBody),
    );
  }
}
