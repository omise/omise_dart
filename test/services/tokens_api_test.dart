import 'dart:convert';

import 'package:http/testing.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/models/requests/create_token_request.dart';
import 'package:omise_dart/src/models/responses/token.dart';
import 'package:omise_dart/src/omise_http_client.dart';
import 'package:omise_dart/src/services/tokens_api.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../models/responses/mock_data.dart/tokens_mock.dart';

void main() {
  group('TokensApi Tests', () {
    late MockClient mockClient;
    late OmiseHttpClient httpClient;
    late TokensApi tokensApi;

    setUp(() {
      mockClient = MockClient((request) async {
        if (request.method == 'POST' && request.url.path == '/tokens') {
          final requestBody = json.decode(request.body);
          if (requestBody['card']['number'] == '4242424242424242') {
            return http.Response(
                json.encode(TokensMock.createTokenSuccess), 200,
                headers: {'content-type': 'application/json'});
          } else {
            return http.Response(json.encode(TokensMock.invalidCard), 400,
                headers: {'content-type': 'application/json'});
          }
        } else if (request.method == 'GET' &&
            request.url.path == '/tokens/tokn_test_6143sao9orm05j2t78j') {
          return http.Response(json.encode(TokensMock.getToken), 200,
              headers: {'content-type': 'application/json'});
        } else if (request.method == 'GET' &&
            request.url.path == '/tokens/non_existent_token') {
          return http.Response(json.encode(TokensMock.tokenNotFound), 404,
              headers: {'content-type': 'application/json'});
        }

        return http.Response('Not Found', 404);
      });

      httpClient = OmiseHttpClient(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
        httpClient: mockClient,
      );
      tokensApi = TokensApi(httpClient);
    });

    group('create', () {
      test('should return Token on success (200)', () async {
        final createTokenRequest = CreateTokenRequest(
          name: 'Valerio Vincenzo',
          number: '4242424242424242',
          expirationMonth: "06",
          expirationYear: "29",
          securityCode: '123',
        );

        final result = await tokensApi.create(createTokenRequest);

        expect(result, isA<Token>());
        expect(result.id, 'tokn_test_6143sao9orm05j2t78j');
        expect(result.card.lastDigits, '4242');
      });

      test('should throw OmiseApiException on failure (400)', () async {
        final createTokenRequest = CreateTokenRequest(
          name: 'Valerio Vincenzo',
          number: '1234567812345678',
          expirationMonth: "10",
          expirationYear: "25",
          securityCode: '123',
        );

        expect(
          () => tokensApi.create(createTokenRequest),
          throwsA(isA<OmiseApiException>()),
        );
      });
    });

    group('get', () {
      test('should return Token on success (200)', () async {
        final tokenId = 'tokn_test_6143sao9orm05j2t78j';

        final result = await tokensApi.get(tokenId);

        expect(result, isA<Token>());
        expect(result.id, 'tokn_test_6143sao9orm05j2t78j');
        expect(result.card.lastDigits, '4242');
      });

      test('should throw OmiseApiException on failure (404)', () async {
        final tokenId = 'non_existent_token';

        expect(
          () => tokensApi.get(tokenId),
          throwsA(isA<OmiseApiException>()),
        );
      });
    });
  });
}
