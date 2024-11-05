enum ChargeStatus {
  failed,
  expired,
  pending,
  reversed,
  successful,
  unknown, // when there is no charge attached to the token
}

extension ChargeStatusExtension on ChargeStatus {
  static ChargeStatus fromString(String? value) {
    return ChargeStatus.values.firstWhere(
      (status) => status.name.toLowerCase() == value?.toLowerCase(),
      orElse: () => ChargeStatus.unknown,
    );
  }
}
