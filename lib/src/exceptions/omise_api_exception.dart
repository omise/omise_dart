import 'package:omise_dart/src/models/responses/omise_api_error.dart';

class OmiseApiException implements Exception {
  final String message;
  final OmiseApiError? response;
  final int? statusCode;

  OmiseApiException({
    required this.message,
    this.response,
    this.statusCode,
  });

  @override
  String toString() {
    if (response != null) {
      return "$message, api message: ${response!.message}, error code: ${response!.code}, statusCode: $statusCode, object: ${response!.object}, location: ${response!.location}";
    } else {
      return message;
    }
  }
}
