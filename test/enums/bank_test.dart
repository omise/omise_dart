import 'package:test/test.dart';
import 'package:omise_dart/src/enums/bank.dart';

void main() {
  group('Bank enum tests', () {
    test('fromString() should return the correct enum value for known banks',
        () {
      expect(BankExtension.fromString('test'), equals(Bank.test));
      expect(BankExtension.fromString('bbl'), equals(Bank.bbl));
      expect(BankExtension.fromString('kbank'), equals(Bank.kbank));
      expect(BankExtension.fromString('rbs'), equals(Bank.rbs));
      expect(BankExtension.fromString('ktb'), equals(Bank.ktb));
      expect(BankExtension.fromString('jpm'), equals(Bank.jpm));
      expect(BankExtension.fromString('mufg'), equals(Bank.mufg));
      expect(BankExtension.fromString('ttb'), equals(Bank.ttb));
      expect(BankExtension.fromString('scb'), equals(Bank.scb));
      expect(BankExtension.fromString('citi'), equals(Bank.citi));
      expect(BankExtension.fromString('smbc'), equals(Bank.smbc));
      expect(BankExtension.fromString('sc'), equals(Bank.sc));
      expect(BankExtension.fromString('cimb'), equals(Bank.cimb));
      expect(BankExtension.fromString('uob'), equals(Bank.uob));
      expect(BankExtension.fromString('bay'), equals(Bank.bay));
      expect(BankExtension.fromString('mega'), equals(Bank.mega));
      expect(BankExtension.fromString('boa'), equals(Bank.boa));
      expect(BankExtension.fromString('cacib'), equals(Bank.cacib));
      expect(BankExtension.fromString('gsb'), equals(Bank.gsb));
      expect(BankExtension.fromString('hsbc'), equals(Bank.hsbc));
      expect(BankExtension.fromString('db'), equals(Bank.db));
      expect(BankExtension.fromString('ghb'), equals(Bank.ghb));
      expect(BankExtension.fromString('baac'), equals(Bank.baac));
      expect(BankExtension.fromString('mb'), equals(Bank.mb));
      expect(BankExtension.fromString('bnp'), equals(Bank.bnp));
      expect(BankExtension.fromString('ibank'), equals(Bank.ibank));
      expect(BankExtension.fromString('tisco'), equals(Bank.tisco));
      expect(BankExtension.fromString('kk'), equals(Bank.kk));
      expect(BankExtension.fromString('icbc'), equals(Bank.icbc));
      expect(BankExtension.fromString('tcrb'), equals(Bank.tcrb));
      expect(BankExtension.fromString('lhb'), equals(Bank.lhb));
    });

    test('fromString() should throw ArgumentError for unknown bank', () {
      expect(
        () => BankExtension.fromString('unknown_bank'),
        throwsA(isA<ArgumentError>()
            .having((e) => e.message, 'message', 'Unknown bank: unknown_bank')),
      );
    });

    test('fromString() should be case-insensitive', () {
      expect(BankExtension.fromString('Test'), equals(Bank.test));
      expect(BankExtension.fromString('BBL'), equals(Bank.bbl));
      expect(BankExtension.fromString('kbank'), equals(Bank.kbank));
      expect(BankExtension.fromString('ScB'), equals(Bank.scb));
      expect(BankExtension.fromString('hsbc'), equals(Bank.hsbc));
    });
  });
}
