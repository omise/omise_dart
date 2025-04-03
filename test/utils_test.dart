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
    group('getPlatform', () {
      test('should return empty when running in pure dart environment', () {
        final platform = Utils.getPlatform();
        expect(platform, '');
      });
      // other platforms can't be simulated as the dart test environment will always run in pure dart env.
    });
  });
}
