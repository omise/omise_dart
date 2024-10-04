enum TokenizationMethod {
  googlepay,
  applepay,
}

extension TokenizationMethodExtension on TokenizationMethod {
  static TokenizationMethod fromString(String value) {
    switch (value.toLowerCase()) {
      case 'googlepay':
        return TokenizationMethod.googlepay;
      case 'applepay':
        return TokenizationMethod.applepay;
      default:
        throw ArgumentError('Unknown tokenization method: $value');
    }
  }
}
