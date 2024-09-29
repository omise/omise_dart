import 'dart:convert';

import 'package:http/testing.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/models/responses/capability.dart';
import 'package:omise_dart/src/omise_http_client.dart';
import 'package:omise_dart/src/services/capability_api.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../models/responses/mock_data.dart/capability_mock.dart';

void main() {
  group('CapabilityApi Tests', () {
    late MockClient mockClient;
    late OmiseHttpClient omiseHttpClient;
    late CapabilityApi capabilityApi;

    setUp(() {
      // Mock the successful response with a 200 status code
      mockClient = MockClient((request) async {
        return http.Response(
          json.encode(CapabilityMock.getCapability),
          200,
          headers: {'content-type': 'application/json'},
        );
      });
      // Initialize the mock client and OmiseHttpClient before each test
      omiseHttpClient = OmiseHttpClient(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
        httpClient: mockClient,
      );
      capabilityApi = CapabilityApi(omiseHttpClient);
    });

    group('get', () {
      test('should return Capability on success (200)', () async {
        // Act
        final result = await capabilityApi.get();

        // Assert
        expect(result, isA<Capability>());
        expect(result.object, 'capability');
        expect(result.location, '/capability');
        expect(result.banks, ['bank1', 'bank2']);
        expect(result.zeroInterestInstallments, true);
        expect(result.limits.chargeAmount.max, 100000);
        expect(result.paymentMethods.first.name, 'credit_card');
        expect(result.paymentMethods.first.cardBrands, ['visa', 'mastercard']);
      });

      test('should throw OmiseApiException on failure (404)', () async {
        // Mock the error response with a 404 status code
        mockClient = MockClient((request) async {
          return http.Response(
            json.encode(CapabilityMock.authFailed),
            401,
            headers: {'content-type': 'application/json'},
          );
        });
        omiseHttpClient = OmiseHttpClient(
          publicKey: 'test_public_key',
          secretKey: 'test_secret_key',
          httpClient: mockClient,
        );
        capabilityApi = CapabilityApi(omiseHttpClient);
        // Act & Assert
        expect(
          () async => await capabilityApi.get(),
          throwsA(isA<OmiseApiException>().having(
            (e) => e.message,
            'message',
            'Unable to get capability',
          )),
        );
      });
    });
  });
}
