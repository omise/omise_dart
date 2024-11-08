import 'dart:convert';

import 'package:http/testing.dart';
import 'package:omise_dart/omise_dart.dart';
import 'package:omise_dart/src/omise_http_client.dart';
import 'package:omise_dart/src/services/sources_api.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../models/responses/mock_data.dart/sources_mock.dart';

void main() {
  group('SourcesApi Tests', () {
    late MockClient mockClient;
    late OmiseHttpClient omiseHttpClient;
    late SourcesApi sourceApi;

    setUp(() {
      mockClient = MockClient((request) async {
        if (request.method == 'POST' && request.url.path == '/sources') {
          final requestBody = json.decode(request.body);
          if (requestBody['type'] == 'unknown') {
            return http.Response(
              json.encode(SourcesMock.invalidPaymentType),
              400,
            );
          }
          return http.Response(
            json.encode(SourcesMock.createSourceSuccess),
            200,
          );
        } else if (request.method == 'GET' &&
            request.url.path == '/sources/src_test_61ogzjw3to8279z8f6p') {
          return http.Response(json.encode(SourcesMock.getSource), 200,
              headers: {'content-type': 'application/json'});
        } else if (request.method == 'GET' &&
            request.url.path == '/sources/non_existent_id') {
          return http.Response(json.encode(SourcesMock.sourceNotFound), 404,
              headers: {'content-type': 'application/json'});
        }

        return http.Response('Not Found', 404);
      });

      omiseHttpClient = OmiseHttpClient(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
        httpClient: mockClient,
      );
      sourceApi = SourcesApi(omiseHttpClient);
    });

    group('create', () {
      test('should return Source on success (200)', () async {
        final createSourceRequest = CreateSourceRequest(
            name: 'Valerio Vincenzo',
            amount: 20000,
            currency: Currency.thb,
            type: PaymentMethodName.promptpay);

        final result = await sourceApi.create(createSourceRequest);

        expect(result, isA<Source>());
        expect(result.id, 'src_test_61ogzjw3to8279z8f6p');
        expect(result.type, PaymentMethodName.promptpay);
      });

      test('should throw OmiseApiException on failure (400)', () async {
        final createSourceRequest = CreateSourceRequest(
            name: 'Valerio Vincenzo',
            amount: 20000,
            currency: Currency.thb,
            type: PaymentMethodName.unknown);

        expect(
          () => sourceApi.create(createSourceRequest),
          throwsA(isA<OmiseApiException>()),
        );
      });
    });

    group('get', () {
      test('should return Source on success (200)', () async {
        final sourceId = 'src_test_61ogzjw3to8279z8f6p';

        final result = await sourceApi.get(sourceId);

        expect(result, isA<Source>());
        expect(result.id, 'src_test_61ogzjw3to8279z8f6p');
      });

      test('should throw OmiseApiException on failure (404)', () async {
        final sourceId = 'non_existent_id';

        expect(
          () => sourceApi.get(sourceId),
          throwsA(isA<OmiseApiException>()),
        );
      });
    });
  });
}
