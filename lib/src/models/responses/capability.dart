import 'package:omise_dart/src/enums/currency.dart';

class Capability {
  final String object;
  final String location;
  final List<String> banks;
  final Limits limits;
  final List<PaymentMethod> paymentMethods;
  final List<String> tokenizationMethods;
  final bool zeroInterestInstallments;
  final String country;

  Capability({
    required this.object,
    required this.location,
    required this.banks,
    required this.limits,
    required this.paymentMethods,
    required this.tokenizationMethods,
    required this.zeroInterestInstallments,
    required this.country,
  });

  factory Capability.fromJson(Map<String, dynamic> json) {
    return Capability(
      object: json['object'],
      location: json['location'],
      banks: List<String>.from(json['banks']),
      limits: Limits.fromJson(json['limits']),
      paymentMethods: (json['payment_methods'] as List)
          .map((item) => PaymentMethod.fromJson(item))
          .toList(),
      tokenizationMethods:
          List<String>.from(json['tokenization_methods'] ?? []),
      zeroInterestInstallments: json['zero_interest_installments'] ?? false,
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'location': location,
      'banks': banks,
      'limits': limits.toJson(),
      'payment_methods': paymentMethods.map((pm) => pm.toJson()).toList(),
      'tokenization_methods': tokenizationMethods,
      'zero_interest_installments': zeroInterestInstallments,
      'country': country,
    };
  }
}

// Limits model
class Limits {
  final Amount chargeAmount;
  final Amount transferAmount;
  final InstallmentAmount installmentAmount;

  Limits({
    required this.chargeAmount,
    required this.transferAmount,
    required this.installmentAmount,
  });

  factory Limits.fromJson(Map<String, dynamic> json) {
    return Limits(
      chargeAmount: Amount.fromJson(json['charge_amount']),
      transferAmount: Amount.fromJson(json['transfer_amount']),
      installmentAmount: InstallmentAmount.fromJson(json['installment_amount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'charge_amount': chargeAmount.toJson(),
      'transfer_amount': transferAmount.toJson(),
      'installment_amount': installmentAmount.toJson(),
    };
  }
}

// Amount model
class Amount {
  final int max;
  final int min;

  Amount({
    required this.max,
    required this.min,
  });

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      max: json['max'],
      min: json['min'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'max': max,
      'min': min,
    };
  }
}

// InstallmentAmount model
class InstallmentAmount {
  final int min;

  InstallmentAmount({
    required this.min,
  });

  factory InstallmentAmount.fromJson(Map<String, dynamic> json) {
    return InstallmentAmount(
      min: json['min'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
    };
  }
}

// PaymentMethod model
class PaymentMethod {
  final String object;
  final String name;
  final List<Currency> currencies;
  final List<String>? cardBrands;
  final List<int>? installmentTerms;
  final List<String> banks;
  final String? provider;

  PaymentMethod({
    required this.object,
    required this.name,
    required this.currencies,
    this.cardBrands,
    this.installmentTerms,
    required this.banks,
    this.provider,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      object: json['object'],
      name: json['name'],
      currencies: (json['currencies'] as List)
          .map((item) => CurrencyExtension.fromString(item))
          .toList(),
      cardBrands: json['card_brands'] != null
          ? List<String>.from(json['card_brands'])
          : null,
      installmentTerms: json['installment_terms'] != null
          ? List<int>.from(json['installment_terms'])
          : null,
      banks: List<String>.from(json['banks']),
      provider: json['provider'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'name': name,
      'currencies':
          currencies.map((currency) => currency.name.toUpperCase()).toList(),
      'card_brands': cardBrands,
      'installment_terms': installmentTerms,
      'banks': banks,
      'provider': provider,
    };
  }
}
