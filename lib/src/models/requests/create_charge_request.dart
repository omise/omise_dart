import 'package:omise_dart/omise_dart.dart';
import 'package:omise_dart/src/extensions/date_time_no_milliseconds.dart';

class CreateChargeRequest {
  final int amount;
  final Currency currency;
  final AuthorizationType? authorizationType;
  final bool? capture;
  final String? card;
  final String? customer;
  final String? description;
  final DateTime? expiresAt;
  final String? firstCharge;
  final String? ip;
  final String? linkedAccount;
  final Map<String, dynamic>? metadata;
  final PlatformFeeRequest? platformFee;
  final String? recurringReason;
  final String? returnUri;
  final String? source;
  final String? transactionIndicator;
  final List<String>? webhookEndpoints;
  final bool? zeroInterestInstallments;

  CreateChargeRequest({
    required this.amount,
    required this.currency,
    this.authorizationType,
    this.capture,
    this.card,
    this.customer,
    this.description,
    this.expiresAt,
    this.firstCharge,
    this.ip,
    this.linkedAccount,
    this.metadata,
    this.platformFee,
    this.recurringReason,
    this.returnUri,
    this.source,
    this.transactionIndicator,
    this.webhookEndpoints,
    this.zeroInterestInstallments,
  });

  factory CreateChargeRequest.fromJson(Map<String, dynamic> json) {
    return CreateChargeRequest(
      amount: json['amount'],
      currency: CurrencyExtension.fromString(json['currency']),
      authorizationType: json['authorization_type'] != null
          ? AuthorizationTypeExtension.fromString(json['authorization_type'])
          : null,
      capture: json['capture'],
      card: json['card'],
      customer: json['customer'],
      description: json['description'],
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : null,
      firstCharge: json['first_charge'],
      ip: json['ip'],
      linkedAccount: json['linked_account'],
      metadata: json['metadata'],
      platformFee: json['platform_fee'] != null
          ? PlatformFeeRequest.fromJson(json['platform_fee'])
          : null,
      recurringReason: json['recurring_reason'],
      returnUri: json['return_uri'],
      source: json['source'],
      transactionIndicator: json['transaction_indicator'],
      webhookEndpoints: (json['webhook_endpoints'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      zeroInterestInstallments: json['zero_interest_installments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency.value,
      'authorization_type': authorizationType?.value,
      'capture': capture,
      'card': card,
      'customer': customer,
      'description': description,
      'expires_at': expiresAt?.toIso8601StringWithoutMilliseconds(),
      'first_charge': firstCharge,
      'ip': ip,
      'linked_account': linkedAccount,
      'metadata': metadata,
      'platform_fee': platformFee?.toJson(),
      'recurring_reason': recurringReason,
      'return_uri': returnUri,
      'source': source,
      'transaction_indicator': transactionIndicator,
      'webhook_endpoints': webhookEndpoints,
      'zero_interest_installments': zeroInterestInstallments,
    };
  }
}

class PlatformFeeRequest {
  final int? fixed;
  final num? percentage;

  PlatformFeeRequest({
    required this.fixed,
    required this.percentage,
  });

  factory PlatformFeeRequest.fromJson(Map<String, dynamic> json) {
    return PlatformFeeRequest(
      fixed: json['fixed'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fixed': fixed,
      'percentage': percentage,
    };
  }
}
