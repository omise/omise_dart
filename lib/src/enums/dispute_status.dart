enum DisputeStatus {
  open,
  pending,
  won,
  lost,
  unknown,
}

extension DisputeStatusExtension on DisputeStatus {
  static DisputeStatus fromString(String? value) {
    return DisputeStatus.values.firstWhere(
      (status) => status.name.toLowerCase() == value?.toLowerCase(),
      orElse: () => DisputeStatus.unknown,
    );
  }
}
