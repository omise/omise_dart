import 'package:test/test.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/enums/currency.dart';

void main() {
  group('Currency enum tests', () {
    test(
        'fromString() should return the correct enum value for known currencies',
        () {
      expect(CurrencyExtension.fromString('THB'), equals(Currency.THB));
      expect(CurrencyExtension.fromString('JPY'), equals(Currency.JPY));
      expect(CurrencyExtension.fromString('USD'), equals(Currency.USD));
      expect(CurrencyExtension.fromString('EUR'), equals(Currency.EUR));
      expect(CurrencyExtension.fromString('GBP'), equals(Currency.GBP));
      expect(CurrencyExtension.fromString('SGD'), equals(Currency.SGD));
      expect(CurrencyExtension.fromString('AUD'), equals(Currency.AUD));
      expect(CurrencyExtension.fromString('CHF'), equals(Currency.CHF));
      expect(CurrencyExtension.fromString('CNY'), equals(Currency.CNY));
      expect(CurrencyExtension.fromString('DKK'), equals(Currency.DKK));
      expect(CurrencyExtension.fromString('HKD'), equals(Currency.HKD));
    });

    test('fromString() should throw OmiseApiException for unknown currency',
        () {
      expect(
          () => CurrencyExtension.fromString('XYZ'),
          throwsA(isA<OmiseApiException>()
              .having((e) => e.message, 'message', 'Unknown currency: XYZ')));
    });

    test('fromString() should be case-insensitive', () {
      expect(CurrencyExtension.fromString('thb'), equals(Currency.THB));
      expect(CurrencyExtension.fromString('jpy'), equals(Currency.JPY));
      expect(CurrencyExtension.fromString('usd'), equals(Currency.USD));
    });
  });
}
