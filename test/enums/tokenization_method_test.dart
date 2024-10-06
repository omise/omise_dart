import 'package:test/test.dart';
import 'package:omise_dart/src/enums/tokenization_method.dart';

void main() {
  group('TokenizationMethod enum tests', () {
    test(
        'fromString() should return the correct enum value for known tokenization methods',
        () {
      expect(TokenizationMethodExtension.fromString('googlepay'),
          equals(TokenizationMethod.googlepay));
      expect(TokenizationMethodExtension.fromString('applepay'),
          equals(TokenizationMethod.applepay));
    });

    test('fromString() should return unknown for unknown tokenization method',
        () {
      expect(TokenizationMethodExtension.fromString('unknown'),
          equals(TokenizationMethod.unknown));
    });

    test('fromString() should be case-insensitive', () {
      expect(TokenizationMethodExtension.fromString('GooglePay'),
          equals(TokenizationMethod.googlepay));
      expect(TokenizationMethodExtension.fromString('APPLEPAY'),
          equals(TokenizationMethod.applepay));
    });
  });
}
