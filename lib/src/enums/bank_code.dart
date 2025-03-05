enum BankCode {
  affin('affin'),
  agro('agro'),
  alliance('alliance'),
  ambank('ambank'),
  islam('islam'),
  muamalat('muamalat'),
  bocm('bocm'),
  rakyat('rakyat'),
  bsn('bsn'),
  cimb('cimb'),
  citi('citi'),
  hongleong('hongleong'),
  hsbc('hsbc'),
  kfh('kfh'),
  maybank2e('maybank2e'),
  maybank2u('maybank2u'),
  ocbc('ocbc'),
  public('public'),
  rhb('rhb'),
  sbcA('sbc_a'),
  sbcB('sbc_b'),
  sbcC('sbc_c'),
  sc('sc'),
  uob('uob'),

  /// Represents an unknown bank, used to handle cases where the bank is not recognized.
  unknown('unknown');

  final String value;

  const BankCode(this.value);
}

extension BankCodeExtension on BankCode {
  static BankCode fromString(String? value) {
    return BankCode.values.firstWhere(
      (bank) => bank.value.toLowerCase() == value?.toLowerCase(),
      orElse: () => BankCode.unknown,
    );
  }
}
