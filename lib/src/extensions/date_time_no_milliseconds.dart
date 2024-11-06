extension DateTimeExtensions on DateTime {
  String toIso8601StringWithoutMilliseconds() {
    return '${toUtc().toIso8601String().split('.').first}Z';
  }
}
