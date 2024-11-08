enum AbsorptionType {
  customer("customer"),
  merchant("merchant"),
  unknown("unknown"); // Added unknown for safety

  final String value;
  const AbsorptionType(this.value);
}

extension AbsorptionTypeExtension on AbsorptionType {
  static AbsorptionType fromString(String? absorptionType) {
    return AbsorptionType.values.firstWhere(
      (type) => type.value.toLowerCase() == absorptionType?.toLowerCase(),
      orElse: () => AbsorptionType.unknown,
    );
  }
}
