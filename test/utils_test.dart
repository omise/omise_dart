import 'dart:convert';
import 'package:omise_dart/src/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Utils Tests', () {
    group('base64encodeString', () {
      test('should return base64 encoded string', () {
        const key = 'testKey';
        final encoded = Utils.base64encodeString(key);
        final expectedEncodedKey = base64Encode(utf8.encode(key));

        expect(encoded, expectedEncodedKey);
      });
    });
  });
}
