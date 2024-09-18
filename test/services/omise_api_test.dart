import 'package:omise_dart/omise_dart.dart';
import 'package:omise_dart/src/omise_http_client.dart';
import 'package:omise_dart/src/services/tokens_api.dart';
import 'package:test/test.dart';

void main() {
  group('OmiseApi Tests', () {
    test('should initialize TokensApi with proper HTTP client', () {
      // Arrange: Create an instance of OmiseApi with dummy keys and parameters
      final omiseApi = OmiseApi(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
        enableDebug: true,
        ignoreNullKeys: false,
        userAgent: 'TestAgent/1.0',
      );

      // Assert: Verify that TokensApi is initialized and accessible
      expect(omiseApi.tokens, isNotNull);
      expect(omiseApi.tokens, isA<TokensApi>());
    });

    test('should correctly pass parameters to OmiseHttpClient', () {
      // Arrange: Mock the HTTP client and capture the initialization
      OmiseHttpClient capturedHttpClient;

      // Use the constructor to test the creation of the OmiseHttpClient with various parameters
      final omiseApi = OmiseApi(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
        enableDebug: true,
        ignoreNullKeys: false,
        userAgent: 'CustomUserAgent/1.0',
      );

      // Extract the internal httpClient from TokensApi to verify that it has the correct properties
      capturedHttpClient = omiseApi.tokens.httpClient;

      // Assert: Verify that the correct parameters were passed to the OmiseHttpClient
      expect(capturedHttpClient.publicKey, equals('test_public_key'));
      expect(capturedHttpClient.secretKey, equals('test_secret_key'));
      expect(capturedHttpClient.enableDebug, isTrue);
      expect(capturedHttpClient.ignoreNullKeys, isFalse);
      expect(capturedHttpClient.userAgent, equals('CustomUserAgent/1.0'));
    });

    test(
        'should initialize with only public key and secret key (other params null)',
        () {
      // Arrange: Only pass the required keys to the constructor
      final omiseApi = OmiseApi(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
      );

      // Assert: Ensure the TokensApi is initialized correctly
      expect(omiseApi.tokens, isNotNull);
      expect(omiseApi.tokens, isA<TokensApi>());

      // Check the internal HTTP client values
      final httpClient = omiseApi.tokens.httpClient;
      expect(httpClient.publicKey, equals('test_public_key'));
      expect(httpClient.secretKey, equals('test_secret_key'));
      expect(httpClient.enableDebug, isNull);
      expect(httpClient.ignoreNullKeys, isNull);
      expect(httpClient.userAgent, isNull);
    });
  });
}