enum Environment {
  production,
  staging;

  String getBaseUrl() {
    switch (this) {
      case Environment.production:
        return 'https://api.omise.co';
      case Environment.staging:
        return String.fromEnvironment('BASE_STAGING_URL');
    }
  }

  String getBaseVaultUrl() {
    switch (this) {
      case Environment.production:
        return 'https://vault.omise.co';
      case Environment.staging:
        return String.fromEnvironment('BASE_STAGING_VAULT_URL');
    }
  }
}
