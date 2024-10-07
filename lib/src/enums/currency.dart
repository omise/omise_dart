// Enum for Currency
enum Currency {
  thb('THB'),
  jpy('JPY'),
  usd('USD'),
  eur('EUR'),
  gbp('GBP'),
  sgd('SGD'),
  aud('AUD'),
  chf('CHF'),
  cny('CNY'),
  dkk('DKK'),
  hkd('HKD'),

  /// Represents an unknown currency, used to handle cases where the currency is not recognized.
  unknown('unknown');

  final String value;

  const Currency(this.value);
}

extension CurrencyExtension on Currency {
  static Currency fromString(String value) {
    return Currency.values.firstWhere(
      (currency) => currency.value.toLowerCase() == value.toLowerCase(),
      orElse: () => Currency.unknown,
    );
  }
}
