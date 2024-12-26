enum OmiseApiErrors {
  bothKeysAreInvalid(message: "Both keys are invalid"),
  unableToCreateToken(message: "Unable to create token"),
  unableToGetToken(message: "Unable to get token"),
  unableToGetCapability(message: "Unable to get capability"),
  unableToCreateSource(message: "Unable to create source"),
  unableToGetSource(message: "Unable to get source"),
  secretKeyMustNotBeUsedInFrontendEnvironments(
      message: 'Secret key must not be used in frontend environments');

  final String message;

  const OmiseApiErrors({required this.message});
}
