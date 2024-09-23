import 'package:test/test.dart';
import 'package:omise_dart/src/models/responses/omise_api_error.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';

void main() {
  group('OmiseApiException Tests', () {
    test('should initialize with only a message', () {
      // Arrange: Create an exception with only a message
      final exception = OmiseApiException(message: 'An error occurred');

      // Assert: Verify that the message is set correctly and other fields are null
      expect(exception.message, equals('An error occurred'));
      expect(exception.response, isNull);
      expect(exception.statusCode, isNull);
    });

    test('should initialize with message, response, and statusCode', () {
      // Arrange: Create a dummy OmiseApiError object
      final apiError = OmiseApiError(
        message: 'Invalid request',
        code: 'invalid_request_error',
        object: 'error',
        location: 'token',
      );

      // Create an exception with message, response, and statusCode
      final exception = OmiseApiException(
        message: 'API error occurred',
        response: apiError,
        statusCode: 400,
      );

      // Assert: Verify that all fields are set correctly
      expect(exception.message, equals('API error occurred'));
      expect(exception.response, isNotNull);
      expect(exception.response!.message, equals('Invalid request'));
      expect(exception.statusCode, equals(400));
    });

    test('toString should return correct message without response', () {
      // Arrange: Create an exception with only a message
      final exception = OmiseApiException(message: 'An error occurred');

      // Act: Get the string representation
      final result = exception.toString();

      // Assert: Verify the string representation is just the message
      expect(result, equals('An error occurred'));
    });

    test('toString should return correct message with response and statusCode',
        () {
      // Arrange: Create a dummy OmiseApiError object
      final apiError = OmiseApiError(
        message: 'Invalid request',
        code: 'invalid_request_error',
        object: 'error',
        location: 'token',
      );

      // Create an exception with message, response, and statusCode
      final exception = OmiseApiException(
        message: 'API error occurred',
        response: apiError,
        statusCode: 400,
      );

      // Act: Get the string representation
      final result = exception.toString();

      // Assert: Verify the string contains the message, response, and statusCode
      expect(
          result,
          equals(
              'API error occurred, api message: Invalid request, error code: invalid_request_error, statusCode: 400, object: error, location: token'));
    });
  });
}
