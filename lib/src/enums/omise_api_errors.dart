enum OmiseApiErrors {
  bothKeysAreInvalid(message: "Both keys are invalid"),
  unableToCreateToken(message: "Unable to create token"),
  unableToGetToken(message: "Unable to get token"),
  unableToGetCapability(message: "Unable to get capability");

  final String message;

  const OmiseApiErrors({required this.message});
}
