import 'dart:convert';

import 'package:http/testing.dart';
import 'package:omise_dart/omise_dart.dart';
import 'package:omise_dart/src/omise_http_client.dart';
import 'package:omise_dart/src/services/charges_api.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../models/responses/mock_data.dart/charges_mock.dart';

void main() {
  group('ChargesApi Tests', () {
    late MockClient mockClient;
    late OmiseHttpClient omiseHttpClient;
    late ChargesApi chargesApi;

    setUp(() {
      mockClient = MockClient((request) async {
        if (request.method == 'POST' && request.url.path == '/charges') {
          final requestBody = json.decode(request.body);
          if (requestBody['source'] == 'unknown') {
            return http.Response(
              json.encode(ChargesMock.invalidPaymentType),
              400,
            );
          }
          return http.Response(
            json.encode(ChargesMock.createChargeSuccess),
            200,
          );
        } else if (request.method == 'GET' &&
            request.url.path == '/charges/chrg_63f4bvoea7xdc1je2ry') {
          return http.Response(json.encode(ChargesMock.getCharge), 200,
              headers: {'content-type': 'application/json'});
        } else if (request.method == 'GET' &&
            request.url.path == '/charges/non_existent_id') {
          return http.Response(json.encode(ChargesMock.chargeNotFound), 404,
              headers: {'content-type': 'application/json'});
        }

        return http.Response('Not Found', 404);
      });

      omiseHttpClient = OmiseHttpClient(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
        httpClient: mockClient,
      );
      chargesApi = ChargesApi(omiseHttpClient);
    });

    group('create', () {
      test('should return Charge on success (200)', () async {
        final createChargeRequest = CreateChargeRequest(
            amount: 20000,
            currency: Currency.thb,
            source: "src_63f4bvo6mlqr3c4gs2g");

        final result = await chargesApi.create(createChargeRequest);

        expect(result, isA<Charge>());
        expect(result.id, "chrg_63f4bvoea7xdc1je2ry");
        expect(result.source?.id, "src_63f4bvo6mlqr3c4gs2g");
      });

      test('should throw OmiseApiException on failure (400)', () async {
        final createChargeRequest = CreateChargeRequest(
            amount: 20000, currency: Currency.thb, source: "unknown");

        expect(
          () => chargesApi.create(createChargeRequest),
          throwsA(isA<OmiseApiException>()),
        );
      });
    });

    group('get', () {
      test('should return Charge on success (200)', () async {
        final chargeId = 'chrg_63f4bvoea7xdc1je2ry';

        final result = await chargesApi.get(chargeId);

        expect(result, isA<Charge>());
        expect(result.id, chargeId);
      });

      test('should throw OmiseApiException on failure (404)', () async {
        final chargeId = 'non_existent_id';

        expect(
          () => chargesApi.get(chargeId),
          throwsA(isA<OmiseApiException>()),
        );
      });
    });
  });
}
