extension RemoveNullValuesNullable on Map<String, dynamic>? {
  void removeNullValues() {
    if (this == null) return;

    // Iterate over the keys of the map
    final keysToRemove = <String>[];

    this!.forEach((key, value) {
      if (value == null) {
        keysToRemove.add(key);
      } else if (value is Map<String, dynamic>) {
        // Recursively remove null values from nested maps
        value.removeNullValues();
        // If the nested map becomes empty after removal, remove it too
        if (value.isEmpty) keysToRemove.add(key);
      } else if (value is List) {
        // Check if any list items are maps and remove nulls inside them
        for (var item in value) {
          if (item is Map<String, dynamic>) {
            item.removeNullValues();
          }
        }
      }
    });

    // Remove collected keys
    for (var key in keysToRemove) {
      this!.remove(key);
    }
  }
}
