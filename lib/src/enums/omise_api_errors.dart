enum OmiseApiErrors {
  bothKeysAreInvalid(message: "Both keys are invalid"),
  unableToCreateToken(message: "Unable to create token"),
  unableToGetToken(message: "Unable to get token"),
  unableToGetCapability(message: "Unable to get capability"),
  unableToCreateSource(message: "Unable to create source"),
  unableToGetSource(message: "Unable to get source");

  final String message;

  const OmiseApiErrors({required this.message});
}
