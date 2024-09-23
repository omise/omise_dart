enum Environment {
  baseUrl(value: "https://api.omise.co"),
  baseVaultUrl(value: "https://vault.omise.co");

  final String value;

  const Environment({required this.value});
}
