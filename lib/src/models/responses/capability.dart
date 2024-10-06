import 'package:omise_dart/src/enums/bank.dart';
import 'package:omise_dart/src/enums/card_brand.dart';
import 'package:omise_dart/src/enums/currency.dart';
import 'package:omise_dart/src/enums/payment_method_name.dart';
import 'package:omise_dart/src/enums/tokenization_method.dart';

class Capability {
  final String object;
  final String location;
  final List<Bank> banks;
  final Limits limits;
  final List<PaymentMethod> paymentMethods;
  final List<TokenizationMethod> tokenizationMethods;
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
      banks: (json['banks'] as List)
          .map((item) => BankExtension.fromString(item))
          .toList(),
      limits: Limits.fromJson(json['limits']),
      paymentMethods: (json['payment_methods'] as List)
          .map((item) => PaymentMethod.fromJson(item))
          .toList(),
      tokenizationMethods: (json['tokenization_methods'] as List)
          .map((item) => TokenizationMethodExtension.fromString(item))
          .toList(),
      zeroInterestInstallments: json['zero_interest_installments'] ?? false,
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'location': location,
      'banks': banks.map((bank) => bank.value).toList(),
      'limits': limits.toJson(),
      'payment_methods': paymentMethods.map((pm) => pm.toJson()).toList(),
      'tokenization_methods':
          tokenizationMethods.map((method) => method.name).toList(),
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
  final PaymentMethodName name;
  final List<Currency> currencies;
  final List<CardBrand>? cardBrands;
  final List<int>? installmentTerms;
  final List<Bank> banks;
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
      name: PaymentMethodNameExtension.fromString(json['name']),
      currencies: (json['currencies'] as List)
          .map((item) => CurrencyExtension.fromString(item))
          .toList(),
      cardBrands: json['card_brands'] != null
          ? (json['card_brands'] as List)
              .map((item) => CardBrand.fromString(item))
              .toList()
          : null,
      installmentTerms: json['installment_terms'] != null
          ? List<int>.from(json['installment_terms'])
          : null,
      banks: (json['banks'] as List)
          .map((item) => BankExtension.fromString(item))
          .toList(),
      provider: json['provider'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'name': name.value,
      'currencies': currencies.map((currency) => currency.value).toList(),
      'card_brands': cardBrands?.map((cardBrand) => cardBrand.value).toList(),
      'installment_terms': installmentTerms,
      'banks': banks.map((bank) => bank.value).toList(),
      'provider': provider,
    };
  }
}
