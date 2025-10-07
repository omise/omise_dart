import 'package:test/test.dart';
import 'package:omise_dart/src/enums/authentication_type.dart';

void main() {
  group('AuthenticationType enum tests', () {
    test('fromString() should return the correct enum value for known flows',
        () {
      expect(AuthenticationTypeExtension.fromString('PASSKEY'),
          equals(AuthenticationType.passKey));
      expect(AuthenticationTypeExtension.fromString('3DS'),
          equals(AuthenticationType.threeDS));
    });

    test('fromString() should return unknown for unknown flow', () {
      expect(AuthenticationTypeExtension.fromString('XYZ'),
          equals(AuthenticationType.unknown));
      expect(AuthenticationTypeExtension.fromString(null),
          equals(AuthenticationType.unknown));
      expect(AuthenticationTypeExtension.fromString(''),
          equals(AuthenticationType.unknown));
    });

    test('fromString() should be case-insensitive', () {
      expect(AuthenticationTypeExtension.fromString('passkey'),
          equals(AuthenticationType.passKey));
      expect(AuthenticationTypeExtension.fromString('3ds'),
          equals(AuthenticationType.threeDS));
      expect(AuthenticationTypeExtension.fromString('PaSsKeY'),
          equals(AuthenticationType.passKey));
    });
  });
}
