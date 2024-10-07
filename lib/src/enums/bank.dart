enum Bank {
  test('test'),
  bbl('bbl'),
  kbank('kbank'),
  rbs('rbs'),
  ktb('ktb'),
  jpm('jpm'),
  mufg('mufg'),
  ttb('ttb'),
  scb('scb'),
  citi('citi'),
  smbc('smbc'),
  sc('sc'),
  cimb('cimb'),
  uob('uob'),
  bay('bay'),
  mega('mega'),
  boa('boa'),
  cacib('cacib'),
  gsb('gsb'),
  hsbc('hsbc'),
  db('db'),
  ghb('ghb'),
  baac('baac'),
  mb('mb'),
  bnp('bnp'),
  ibank('ibank'),
  tisco('tisco'),
  kk('kk'),
  icbc('icbc'),
  tcrb('tcrb'),
  lhb('lhb'),

  /// Represents an unknown bank, used to handle cases where the bank is not recognized.
  unknown('unknown');

  final String value;

  const Bank(this.value);
}

extension BankExtension on Bank {
  static Bank fromString(String value) {
    return Bank.values.firstWhere(
      (bank) => bank.value.toLowerCase() == value.toLowerCase(),
      orElse: () => Bank.unknown,
    );
  }
}
