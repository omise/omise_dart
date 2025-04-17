enum AuthorizationType {
  preAuth("pre_auth"),
  finalAuth("final_auth"),
  unknown("unknown"); // Added unknown for safety

  final String value;
  const AuthorizationType(this.value);
}

extension AuthorizationTypeExtension on AuthorizationType {
  static AuthorizationType fromString(String? authorizationType) {
    return AuthorizationType.values.firstWhere(
      (type) => type.value.toLowerCase() == authorizationType?.toLowerCase(),
      orElse: () => AuthorizationType.unknown,
    );
  }
}
