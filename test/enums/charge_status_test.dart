import 'package:omise_dart/src/enums/charge_status.dart';
import 'package:test/test.dart';

void main() {
  group('ChargeStatusExtension', () {
    test('fromString should return the correct ChargeStatus for valid strings',
        () {
      expect(ChargeStatusExtension.fromString('failed'), ChargeStatus.failed);
      expect(ChargeStatusExtension.fromString('expired'), ChargeStatus.expired);
      expect(ChargeStatusExtension.fromString('pending'), ChargeStatus.pending);
      expect(
          ChargeStatusExtension.fromString('reversed'), ChargeStatus.reversed);
      expect(ChargeStatusExtension.fromString('successful'),
          ChargeStatus.successful);
    });

    test('fromString should return ChargeStatus.unknown for invalid strings',
        () {
      expect(ChargeStatusExtension.fromString('nonexistent'),
          ChargeStatus.unknown);
      expect(ChargeStatusExtension.fromString(null), ChargeStatus.unknown);
      expect(ChargeStatusExtension.fromString(''), ChargeStatus.unknown);
    });

    test('fromString should be case insensitive', () {
      expect(ChargeStatusExtension.fromString('FAILED'), ChargeStatus.failed);
      expect(ChargeStatusExtension.fromString('Expired'), ChargeStatus.expired);
      expect(ChargeStatusExtension.fromString('PeNdInG'), ChargeStatus.pending);
    });
  });
}
