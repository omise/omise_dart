import 'dart:convert';

import 'package:http/testing.dart';
import 'package:omise_dart/src/enums/environment.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:omise_dart/omise_dart.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';

void main() {
  group('OmiseHttpClient Tests', () {
    final baseUrl = Environment.baseUrl.value;
    late MockClient mockClient;
    late OmiseHttpClient client;

    setUp(() {
      mockClient = MockClient((request) async {
        // Handle GET requests
        if (request.method == 'GET') {
          return http.Response('{"key":"value"}', 200,
              headers: {'content-type': 'application/json'}, request: request);
        }
        // Handle POST and PATCH requests
        else if (request.method == 'POST' || request.method == 'PATCH') {
          return http.Response(request.body, 200,
              request: request, headers: {'content-type': 'application/json'});
        }
        return http.Response('Not Found', 404);
      });
      client = OmiseHttpClient(
        publicKey: 'test_public_key',
        secretKey: 'test_secret_key',
        httpClient: mockClient,
      );
    });

    test('constructor throws exception if both keys are empty', () {
      expect(
        () => OmiseHttpClient(
          publicKey: '',
          secretKey: '',
        ),
        throwsA(isA<OmiseApiException>()),
      );
    });
    test('get sends GET request to the correct URL', () async {
      final getPath = "/getPath";
      final response = await client.get(getPath);
      expect(response.statusCode, equals(200));
      expect(response.body, jsonEncode({"key": "value"}));
      expect(response.request!.url.toString(), "$baseUrl$getPath");
    });

    test('post sends POST request with correct body', () async {
      final postPath = "/postPath";
      final response = await client.post(
        postPath,
        body: {'key2': 'value2'},
      );
      expect(response.statusCode, equals(200));
      expect(response.body, jsonEncode({"key2": "value2"}));
      expect(response.request!.url.toString(), "$baseUrl$postPath");
    });

    test('patch sends PATCH request with correct body', () async {
      final patchPath = "/patchPath";
      final response = await client.post(
        patchPath,
        body: {'key3': 'value3'},
      );
      expect(response.statusCode, equals(200));
      expect(response.body, jsonEncode({"key3": "value3"}));
      expect(response.request!.url.toString(), "$baseUrl$patchPath");
    });
  });
}
