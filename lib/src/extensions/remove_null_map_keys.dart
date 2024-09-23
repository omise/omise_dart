extension RemoveNullValuesNullable on Map<String, dynamic>? {
  void removeNullValues() {
    // Check if the map is not null before trying to remove null values
    if (this != null) {
      this!.removeWhere((key, value) => value == null);
    }
  }
}
