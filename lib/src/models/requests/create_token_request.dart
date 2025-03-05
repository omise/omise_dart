import 'package:omise_dart/src/enums/tokenization_method.dart';

class CreateTokenRequest {
  // Card Payment Fields
  String? name;
  String? number;
  String? expirationMonth;
  String? expirationYear;
  String? securityCode;
  String? city;
  String? country;
  String? postalCode;
  String? phoneNumber;
  String? email;
  String? state;
  String? street1;
  String? street2;

  // Google Pay / Apple Pay Fields
  TokenizationMethod? method; // "googlepay" or "applepay"
  String? data; // Tokenized payment data
  String? billingName;
  String? billingCity;
  String? billingCountry;
  String? billingPostalCode;
  String? billingState;
  String? billingStreet1;
  String? billingStreet2;
  String? billingPhoneNumber;

  CreateTokenRequest({
    // Card payment parameters
    this.name,
    this.number,
    this.expirationMonth,
    this.expirationYear,
    this.securityCode,
    this.city,
    this.country,
    this.postalCode,
    this.phoneNumber,
    this.email,
    this.state,
    this.street1,
    this.street2,

    // Google Pay / Apple Pay parameters
    this.method,
    this.data,
    this.billingName,
    this.billingCity,
    this.billingCountry,
    this.billingPostalCode,
    this.billingState,
    this.billingStreet1,
    this.billingStreet2,
    this.billingPhoneNumber,
  });

  factory CreateTokenRequest.fromJson(Map<String, dynamic> json) {
    return CreateTokenRequest(
      name: json['name'],
      number: json['number'],
      expirationMonth: json['expiration_month'],
      expirationYear: json['expiration_year'],
      securityCode: json['security_code'],
      city: json['city'],
      country: json['country'],
      postalCode: json['postal_code'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      state: json['state'],
      street1: json['street1'],
      street2: json['street2'],
      method: TokenizationMethodExtension.fromString(json['method']),
      data: json['data'],
      billingName: json['billing_name'],
      billingCity: json['billing_city'],
      billingCountry: json['billing_country'],
      billingPostalCode: json['billing_postal_code'],
      billingState: json['billing_state'],
      billingStreet1: json['billing_street1'],
      billingStreet2: json['billing_street2'],
      billingPhoneNumber: json['billing_phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      'method': method?.value,
      'data': data,
      'billing_name': billingName,
      'billing_city': billingCity,
      'billing_country': billingCountry,
      'billing_postal_code': billingPostalCode,
      'billing_state': billingState,
      'billing_street1': billingStreet1,
      'billing_street2': billingStreet2,
      'billing_phone_number': billingPhoneNumber,
    };
  }
}
