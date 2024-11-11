enum TokenizationMethod {
  googlepay("googlepay"),
  applepay("applepay"),
  unknown("unknown"); // Added unknown for safety

  final String value;
  const TokenizationMethod(this.value);
}

extension TokenizationMethodExtension on TokenizationMethod {
  static TokenizationMethod fromString(String? tokenizationName) {
    return TokenizationMethod.values.firstWhere(
      (method) => method.value.toLowerCase() == tokenizationName?.toLowerCase(),
      orElse: () => TokenizationMethod.unknown,
    );
  }
}
