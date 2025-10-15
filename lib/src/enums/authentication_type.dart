enum AuthenticationType {
  passKey("PASSKEY"),
  threeDS("3DS"),
  unknown("unknown"); // Added unknown for safety

  final String value;
  const AuthenticationType(this.value);
}

extension AuthenticationTypeExtension on AuthenticationType {
  static AuthenticationType fromString(String? authFlow) {
    return AuthenticationType.values.firstWhere(
      (type) => type.value.toLowerCase() == authFlow?.toLowerCase(),
      orElse: () => AuthenticationType.unknown,
    );
  }
}
