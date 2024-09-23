class CreateTokenRequest {
  final String name;
  final String number;
  final String expirationMonth;
  final String expirationYear;
  final String? securityCode;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? phoneNumber;
  final String? email;
  final String? state;
  final String? street1;
  final String? street2;

  const CreateTokenRequest({
    required this.name,
    required this.number,
    required this.expirationMonth,
    required this.expirationYear,
    this.securityCode,
    this.city,
    this.country,
    this.postalCode,
    this.phoneNumber,
    this.email,
    this.state,
    this.street1,
    this.street2,
  });

  factory CreateTokenRequest.fromJson(Map<String, dynamic> data) {
    return CreateTokenRequest(
      name: data['name'],
      number: data['number'],
      expirationMonth: data['expiration_month'],
      expirationYear: data['expiration_year'],
      securityCode: data['security_code'],
      city: data['city'],
      country: data['country'],
      postalCode: data['postal_code'],
      phoneNumber: data['phone_number'],
      email: data['email'],
      state: data['state'],
      street1: data['street1'],
      street2: data['street2'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'number': number,
        'expiration_month': expirationMonth,
        'expiration_year': expirationYear,
        'security_code': securityCode,
        'city': city,
        'country': country,
        'postal_code': postalCode,
        'phone_number': phoneNumber,
        'email': email,
        'state': state,
        'street1': street1,
        'street2': street2,
      };
}
