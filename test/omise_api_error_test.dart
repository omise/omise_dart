import 'package:omise_dart/src/models/responses/omise_api_error.dart';
import 'package:test/test.dart';

void main() {
  group('OmiseApiError', () {
    // Test data for instantiation and serialization
    const testObject = 'error';
    const testLocation = 'https://www.omise.co/api-errors#used-token';
    const testCode = 'used_token';
    const testMessage = 'token was already used';

    // Test the constructor and toJson method
    test('should create an instance with the correct properties', () {
      final error = OmiseApiError(
        object: testObject,
        location: testLocation,
        code: testCode,
        message: testMessage,
      );

      expect(error.object, equals(testObject));
      expect(error.location, equals(testLocation));
      expect(error.code, equals(testCode));
      expect(error.message, equals(testMessage));
    });

    // Test the fromJson method
    test('should create an instance from JSON', () {
      final json = {
        'object': testObject,
        'location': testLocation,
        'code': testCode,
        'message': testMessage,
      };

      final error = OmiseApiError.fromJson(json);

      expect(error.object, equals(testObject));
      expect(error.location, equals(testLocation));
      expect(error.code, equals(testCode));
      expect(error.message, equals(testMessage));
    });

    // Test the toJson method
    test('should convert to JSON correctly', () {
      final error = OmiseApiError(
        object: testObject,
        location: testLocation,
        code: testCode,
        message: testMessage,
      );

      final json = error.toJson();

      expect(json['object'], equals(testObject));
      expect(json['location'], equals(testLocation));
      expect(json['code'], equals(testCode));
      expect(json['message'], equals(testMessage));
    });
  });
}
