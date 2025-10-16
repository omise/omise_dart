import 'package:test/test.dart';
import 'package:omise_dart/src/package_info.dart'; // Adjust the path based on your project structure

void main() {
  group('PackageInfo Tests', () {
    test('should return correct package name', () {
      expect(PackageInfo.packageName, 'omise_dart');
    });

    test('should return correct userAgentIdentifier', () {
      expect(PackageInfo.userAgentIdentifier, 'OmiseDart');
    });

    test('should return correct package version', () {
      expect(PackageInfo.packageVersion, '0.8.0');
    });
  });
}
