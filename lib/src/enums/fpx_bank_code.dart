enum FpxBankCode {
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

  const FpxBankCode(this.value);
}

extension FpxBankCodeExtension on FpxBankCode {
  static FpxBankCode fromString(String? value) {
    return FpxBankCode.values.firstWhere(
      (bank) => bank.value.toLowerCase() == value?.toLowerCase(),
      orElse: () => FpxBankCode.unknown,
    );
  }
}
