enum Environment {
  production,
  staging;

  String getBaseUrl() {
    switch (this) {
      case Environment.production:
        return 'https://api.omise.co';
      case Environment.staging:
        return const String.fromEnvironment('BASE_STAGING_URL');
    }
  }

  String getBaseVaultUrl() {
    switch (this) {
      case Environment.production:
        return 'https://vault.omise.co';
      case Environment.staging:
        return const String.fromEnvironment('BASE_STAGING_VAULT_URL');
    }
  }
}

extension EnvironmentExtension on Environment {
  static Environment fromString(String? environment) {
    return Environment.values.firstWhere(
      (type) => type.name.toLowerCase() == environment?.toLowerCase(),
      orElse: () => Environment.production,
    );
  }
}
