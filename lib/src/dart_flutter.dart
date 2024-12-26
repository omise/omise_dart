/// A constant that indicates whether the code is running in a pure Dart environment.
///
/// Similar to Flutter's [kIsWeb](https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html),
/// which determines if the app is running on the web, `kIsPureDart` is used to check if the
/// environment is purely Dart, such as when running in a Dart console application or in a
/// server-side context.
///
/// Use this variable to handle logic specific to non-Flutter or server-side Dart environments.
///
/// Example:
/// ```dart
/// if (kIsPureDart) {
///   print("Running in a pure Dart environment.");
/// } else {
///   print("Running in a Flutter environment.");
/// }
/// ```
const kIsPureDart = false;
