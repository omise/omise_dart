import 'package:omise_dart/src/enums/charge_status.dart';
import 'package:omise_dart/src/extensions/date_time_no_milliseconds.dart';
import 'package:omise_dart/src/models/responses/base_response.dart';

class Token extends BaseResponse {
  final bool used;
  final ChargeStatus chargeStatus;
  final Card card;
  final DateTime createdAt;

  Token({
    required super.object,
    required super.id,
    required super.livemode,
    super.location,
    required this.used,
    required this.chargeStatus,
    required this.card,
    required this.createdAt,
  });

  // Factory method to create Token from JSON
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      object: json['object'],
      id: json['id'],
      livemode: json['livemode'],
      location: json['location'],
      used: json['used'],
      chargeStatus: ChargeStatusExtension.fromString(json['charge_status']),
      card: Card.fromJson(json['card']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Method to convert Token to JSON
  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    baseJson.addAll({
      'used': used,
      'charge_status': chargeStatus.name,
      'card': card.toJson(),
      'created_at': createdAt.toIso8601StringWithoutMilliseconds(),
    });
    return baseJson;
  }
}

class Card extends BaseResponse {
  final bool deleted;
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? phoneNumber;
  final String? postalCode;
  final String? country;
  final String? financing;
  final String? bank;
  final String brand;
  final String fingerprint;
  final String? firstDigits;
  final String lastDigits;
  final String name;
  final int expirationMonth;
  final int expirationYear;
  final bool securityCodeCheck;
  final String? tokenizationMethod;
  final String createdAt;

  Card({
    required super.object,
    required super.id,
    required super.livemode,
    super.location,
    required this.deleted,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.phoneNumber,
    this.postalCode,
    this.country,
    this.financing,
    this.bank,
    required this.brand,
    required this.fingerprint,
    this.firstDigits,
    required this.lastDigits,
    required this.name,
    required this.expirationMonth,
    required this.expirationYear,
    required this.securityCodeCheck,
    this.tokenizationMethod,
    required this.createdAt,
  });

  // Factory method to create Card from JSON
  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      object: json['object'],
      id: json['id'],
      livemode: json['livemode'],
      location: json['location'],
      deleted: json['deleted'],
      street1: json['street1'],
      street2: json['street2'],
      city: json['city'],
      state: json['state'],
      phoneNumber: json['phone_number'],
      postalCode: json['postal_code'],
      country: json['country'],
      financing: json['financing'],
      bank: json['bank'],
      brand: json['brand'],
      fingerprint: json['fingerprint'],
      firstDigits: json['first_digits'],
      lastDigits: json['last_digits'],
      name: json['name'],
      expirationMonth: json['expiration_month'],
      expirationYear: json['expiration_year'],
      securityCodeCheck: json['security_code_check'],
      tokenizationMethod: json['tokenization_method'],
      createdAt: json['created_at'],
    );
  }

  // Method to convert Card to JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'id': id,
      'livemode': livemode,
      'location': location,
      'deleted': deleted,
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'phone_number': phoneNumber,
      'postal_code': postalCode,
      'country': country,
      'financing': financing,
      'bank': bank,
      'brand': brand,
      'fingerprint': fingerprint,
      'first_digits': firstDigits,
      'last_digits': lastDigits,
      'name': name,
      'expiration_month': expirationMonth,
      'expiration_year': expirationYear,
      'security_code_check': securityCodeCheck,
      'tokenization_method': tokenizationMethod,
      'created_at': createdAt,
    };
  }
}
