enum CardBrand {
  americanExpress("American Express"),
  dinersClub("Diners Club"),
  discover("Discover"),
  jcb("JCB"),
  masterCard("MasterCard"),
  maestro("Maestro"),
  unionPay("UnionPay"),
  visa("Visa"),

  /// Represents an unknown card brand, used to handle cases where the card brand is not recognized.
  unknown("unknown");

  final String value;

  const CardBrand(this.value);

  // Convert from string to CardBrand
  static CardBrand fromString(String cardBrand) {
    return CardBrand.values.firstWhere(
      (brand) => brand.value.toLowerCase() == cardBrand.toLowerCase(),
      orElse: () => CardBrand.unknown, // Return unknown for unrecognized brands
    );
  }
}
