import 'package:test/test.dart';
import 'package:omise_dart/src/enums/card_brand.dart';

void main() {
  group('CardBrand enum tests', () {
    test(
        'fromString() should return the correct enum value for known card brands',
        () {
      expect(CardBrand.fromString('American Express'),
          equals(CardBrand.americanExpress));
      expect(CardBrand.fromString('Diners Club'), equals(CardBrand.dinersClub));
      expect(CardBrand.fromString('Discover'), equals(CardBrand.discover));
      expect(CardBrand.fromString('JCB'), equals(CardBrand.jcb));
      expect(CardBrand.fromString('MasterCard'), equals(CardBrand.masterCard));
      expect(CardBrand.fromString('Maestro'), equals(CardBrand.maestro));
      expect(CardBrand.fromString('UnionPay'), equals(CardBrand.unionPay));
      expect(CardBrand.fromString('Visa'), equals(CardBrand.visa));
    });

    test('fromString() should throw ArgumentError for unknown card brand', () {
      expect(
        () => CardBrand.fromString('InvalidCard'),
        throwsA(isA<ArgumentError>().having(
            (e) => e.message, 'message', 'Invalid card brand: InvalidCard')),
      );
    });

    test('fromString() should be case-insensitive', () {
      expect(CardBrand.fromString('american express'),
          equals(CardBrand.americanExpress));
      expect(CardBrand.fromString('DINERS CLUB'), equals(CardBrand.dinersClub));
      expect(CardBrand.fromString('jcb'), equals(CardBrand.jcb));
    });
  });
}
