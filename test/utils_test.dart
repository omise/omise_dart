import 'dart:io';
import 'dart:convert';
import 'package:omise_dart/src/enums/omise_api_errors.dart';
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';
import 'package:omise_dart/src/utils.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

void main() {
  group('Utils Tests', () {
    group('getPackageInfo', () {
      late Directory tempDir;
      late File pubspecFile;

      setUp(() async {
        // Create a temporary directory and a temporary pubspec.yaml file
        tempDir = await Directory.systemTemp.createTemp('test_package');
        pubspecFile = File(path.join(tempDir.path, 'pubspec.yaml'));
      });

      tearDown(() async {
        // Clean up the temporary directory after each test
        await tempDir.delete(recursive: true);
      });

      test('should return package info from pubspec.yaml', () async {
        final pubspecContent = '''
        name: test_package
        version: 1.0.0
        ''';

        // Write the content to the temporary pubspec.yaml file
        await pubspecFile.writeAsString(pubspecContent);

        // Temporarily change the current directory to the temp directory
        final currentDir = Directory.current;
        Directory.current = tempDir;

        final packageInfo = await Utils.getPackageInfo();

        expect(packageInfo['name'], 'test_package');
        expect(packageInfo['version'], '1.0.0');

        // Restore the original directory
        Directory.current = currentDir;
      });

      test('should throw OmiseApiException if pubspec.yaml does not exist',
          () async {
        // Temporarily change the current directory to the temp directory
        final currentDir = Directory.current;
        Directory.current = tempDir;

        expect(
          () async => await Utils.getPackageInfo(),
          throwsA(isA<OmiseApiException>().having((e) => e.message, 'message',
              OmiseApiErrors.pubSpecFileNotFound.message)),
        );

        // Restore the original directory
        Directory.current = currentDir;
      });

      test(
          'should throw OmiseApiException if version not found in pubspec.yaml',
          () async {
        final pubspecContent = '''
        name: test_package
        ''';

        // Write the content to the temporary pubspec.yaml file
        await pubspecFile.writeAsString(pubspecContent);

        // Temporarily change the current directory to the temp directory
        final currentDir = Directory.current;
        Directory.current = tempDir;

        expect(
          () async => await Utils.getPackageInfo(),
          throwsA(isA<OmiseApiException>().having((e) => e.message, 'message',
              OmiseApiErrors.versionNotFound.message)),
        );

        // Restore the original directory
        Directory.current = currentDir;
      });

      test('should throw OmiseApiException if name not found in pubspec.yaml',
          () async {
        final pubspecContent = '''
        version: 1.0.0
        ''';

        // Write the content to the temporary pubspec.yaml file
        await pubspecFile.writeAsString(pubspecContent);

        // Temporarily change the current directory to the temp directory
        final currentDir = Directory.current;
        Directory.current = tempDir;

        expect(
          () async => await Utils.getPackageInfo(),
          throwsA(isA<OmiseApiException>().having((e) => e.message, 'message',
              OmiseApiErrors.nameNotFound.message)),
        );

        // Restore the original directory
        Directory.current = currentDir;
      });
    });

    group('base64encodeString', () {
      test('should return base64 encoded string', () {
        const key = 'testKey';
        final encoded = Utils.base64encodeString(key);
        final expectedEncodedKey = base64Encode(utf8.encode(key));

        expect(encoded, expectedEncodedKey);
      });
    });
  });
}
