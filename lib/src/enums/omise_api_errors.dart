enum OmiseApiErrors {
  bothKeysAreInvalid(message: "Both keys are invalid"),

  pubSpecFileNotFound(message: "Pubspec file not found"),
  versionNotFound(message: "Version not found in pubspec.yaml"),
  nameNotFound(message: "Name not found in pubspec.yaml"),
  unableToCreateToken(message: "Unable to create token"),
  unableToGetToken(message: "Unable to get token"),
  unableToGetCapability(message: "Unable to get capability");

  final String message;

  const OmiseApiErrors({required this.message});
}
