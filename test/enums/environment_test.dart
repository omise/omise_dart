import 'package:test/test.dart';
import 'package:omise_dart/src/enums/environment.dart';

void main() {
  group('EnvironmentExtension', () {
    test('fromString should return the correct Environment for valid strings',
        () {
      expect(EnvironmentExtension.fromString('production'),
          Environment.production);
      expect(EnvironmentExtension.fromString('staging'), Environment.staging);
    });

    test('fromString should be case insensitive', () {
      expect(EnvironmentExtension.fromString('Production'),
          Environment.production);
      expect(EnvironmentExtension.fromString('STAGING'), Environment.staging);
    });

    test('fromString should return production for invalid strings', () {
      expect(
          EnvironmentExtension.fromString('invalid'), Environment.production);
      expect(EnvironmentExtension.fromString(null), Environment.production);
      expect(EnvironmentExtension.fromString(''), Environment.production);
    });
  });

  group('Environment base URLs', () {
    test('getBaseUrl should return correct URL for production', () {
      expect(Environment.production.getBaseUrl(), 'https://api.omise.co');
    });

    test('getBaseVaultUrl should return correct URL for production', () {
      expect(
          Environment.production.getBaseVaultUrl(), 'https://vault.omise.co');
    });

    test('getBaseUrl and getBaseVaultUrl for staging should use env variables',
        () {
      // In test environment, you can't override the envs used as in dart its read only, this will just increase the code coverage but the value of the envs will always be empty.
      // Also adding the actual envs into the test command does not work as its not supported
      const baseStagingUrl = String.fromEnvironment('BASE_STAGING_URL');
      const baseStagingVaultUrl =
          String.fromEnvironment('BASE_STAGING_VAULT_URL');
      expect(Environment.staging.getBaseUrl(), baseStagingUrl);
      expect(Environment.staging.getBaseVaultUrl(), baseStagingVaultUrl);
    });
  });
}
