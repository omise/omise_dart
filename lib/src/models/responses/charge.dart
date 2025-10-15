import 'package:omise_dart/src/enums/authentication_type.dart';
import 'package:omise_dart/src/enums/charge_status.dart';
import 'package:omise_dart/src/enums/currency.dart';
import 'package:omise_dart/src/enums/dispute_status.dart';
import 'package:omise_dart/src/extensions/date_time_no_milliseconds.dart';
import 'package:omise_dart/src/models/responses/source.dart';

class Charge {
  final String object;
  final String id;
  final bool livemode;
  final String location;
  final String? acquirerReferenceNumber;
  final int amount;
  final String? approvalCode;
  final String? authorizationType;
  final String? authorizeUri;
  final bool authorized;
  final int? authorizedAmount;
  final DateTime? authorizedAt;
  final String? branch;
  final bool canPerformVoid;
  final bool capturable;
  final bool capture;
  final int? capturedAmount;
  final CardModel? card;
  final DateTime createdAt;
  final Currency currency;
  final String? customer;
  final String? description;
  final String? device;
  final bool disputable;
  final Dispute? dispute;
  final bool expired;
  final DateTime? expiredAt;
  final DateTime? expiresAt;
  final String? failureCode;
  final String? failureMessage;
  final int? fee;
  final int? feeVat;
  final int? fundingAmount;
  final String? fundingCurrency;
  final int? interest;
  final int? interestVat;
  final String? ip;
  final String? link;
  final LinkedAccount? linkedAccount;
  final String? merchantAdvice;
  final String? merchantAdviceCode;
  final String? merchantName;
  final String? merchantUid;
  final Map<String, dynamic>? metadata;
  final Map<String, dynamic>? missing3dsFields;
  final bool? multiCapture;
  final int? net;
  final bool paid;
  final DateTime? paidAt;
  final bool partiallyRefundable;
  final PlatformFee? platformFee;
  final bool refundable;
  final int? refundedAmount;
  final List<Refund>? refunds;
  final String? returnUri;
  final bool reversed;
  final DateTime? reversedAt;
  final bool reversible;
  final String? schedule;
  final Source? source;
  final ChargeStatus status;
  final String? terminal;
  final String? transaction;
  final TransactionFees? transactionFees;
  final UnmanagedPayment? unmanagedPayment;
  final bool voided;
  final bool zeroInterestInstallments;
  final AuthenticationType? authenticatedBy;

  Charge({
    required this.object,
    required this.id,
    required this.livemode,
    required this.location,
    this.acquirerReferenceNumber,
    required this.amount,
    this.approvalCode,
    this.authorizationType,
    this.authorizeUri,
    required this.authorized,
    required this.authorizedAmount,
    this.authorizedAt,
    this.branch,
    required this.canPerformVoid,
    required this.capturable,
    required this.capture,
    required this.capturedAmount,
    this.card,
    required this.createdAt,
    required this.currency,
    this.customer,
    this.description,
    this.device,
    required this.disputable,
    this.dispute,
    required this.expired,
    this.expiredAt,
    this.expiresAt,
    this.failureCode,
    this.failureMessage,
    this.fee,
    this.feeVat,
    this.fundingAmount,
    this.fundingCurrency,
    this.interest,
    this.interestVat,
    this.ip,
    this.link,
    this.linkedAccount,
    this.merchantAdvice,
    this.merchantAdviceCode,
    this.merchantName,
    this.merchantUid,
    this.metadata,
    this.missing3dsFields,
    this.multiCapture,
    this.net,
    required this.paid,
    this.paidAt,
    required this.partiallyRefundable,
    this.platformFee,
    required this.refundable,
    this.refundedAmount,
    this.refunds,
    this.returnUri,
    required this.reversed,
    this.reversedAt,
    required this.reversible,
    this.schedule,
    this.source,
    required this.status,
    this.terminal,
    this.transaction,
    this.transactionFees,
    this.unmanagedPayment,
    required this.voided,
    required this.zeroInterestInstallments,
    this.authenticatedBy,
  });

  factory Charge.fromJson(Map<String, dynamic> json) => Charge(
      object: json['object'],
      id: json['id'],
      livemode: json['livemode'],
      location: json['location'],
      acquirerReferenceNumber: json['acquirer_reference_number'],
      amount: json['amount'],
      approvalCode: json['approval_code'],
      authorizationType: json['authorization_type'],
      authorizeUri: json['authorize_uri'],
      authorized: json['authorized'],
      authorizedAmount: json['authorized_amount'],
      authorizedAt: json['authorized_at'] != null
          ? DateTime.parse(json['authorized_at'])
          : null,
      branch: json['branch'],
      canPerformVoid: json['can_perform_void'],
      capturable: json['capturable'],
      capture: json['capture'],
      capturedAmount: json['captured_amount'],
      card: json['card'] != null ? CardModel.fromJson(json['card']) : null,
      createdAt: DateTime.parse(json['created_at']),
      currency: CurrencyExtension.fromString(json['currency']),
      customer: json['customer'],
      description: json['description'],
      device: json['device'],
      disputable: json['disputable'],
      dispute:
          json['dispute'] != null ? Dispute.fromJson(json['dispute']) : null,
      expired: json['expired'],
      expiredAt: json['expired_at'] != null
          ? DateTime.parse(json['expired_at'])
          : null,
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : null,
      failureCode: json['failure_code'],
      failureMessage: json['failure_message'],
      fee: json['fee'],
      feeVat: json['fee_vat'],
      fundingAmount: json['funding_amount'],
      fundingCurrency: json['funding_currency'],
      interest: json['interest'],
      interestVat: json['interest_vat'],
      ip: json['ip'],
      link: json['link'],
      linkedAccount: json['linked_account'] != null
          ? LinkedAccount.fromJson(json['linked_account'])
          : null,
      merchantAdvice: json['merchant_advice'],
      merchantAdviceCode: json['merchant_advice_code'],
      merchantName: json['merchant_name'],
      merchantUid: json['merchant_uid'],
      metadata: json['metadata'] != null
          ? Map<String, dynamic>.from(json['metadata'])
          : null,
      missing3dsFields: json['missing_3ds_fields'],
      multiCapture: json['multi_capture'],
      net: json['net'],
      paid: json['paid'],
      paidAt: json['paid_at'] != null ? DateTime.parse(json['paid_at']) : null,
      partiallyRefundable: json['partially_refundable'],
      platformFee: json['platform_fee'] != null
          ? PlatformFee.fromJson(json['platform_fee'])
          : null,
      refundable: json['refundable'],
      refundedAmount: json['refunded_amount'],
      refunds: json['refunds']?['data'] != null
          ? (json['refunds']?['data'] as List)
              .map((refund) => Refund.fromJson(refund))
              .toList()
          : null,
      returnUri: json['return_uri'],
      reversed: json['reversed'],
      reversedAt: json['reversed_at'] != null
          ? DateTime.parse(json['reversed_at'])
          : null,
      reversible: json['reversible'],
      schedule: json['schedule'],
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      status: ChargeStatusExtension.fromString(json['status']),
      terminal: json['terminal'],
      transaction: json['transaction'],
      transactionFees: json['transaction_fees'] != null
          ? TransactionFees.fromJson(json['transaction_fees'])
          : null,
      unmanagedPayment: json['unmanaged_payment'] != null
          ? UnmanagedPayment.fromJson(json['unmanaged_payment'])
          : null,
      voided: json['voided'],
      zeroInterestInstallments: json['zero_interest_installments'],
      authenticatedBy:
          AuthenticationTypeExtension.fromString(json['authenticated_by']));

  Map<String, dynamic> toJson() => {
        'object': object,
        'id': id,
        'livemode': livemode,
        'location': location,
        'acquirer_reference_number': acquirerReferenceNumber,
        'amount': amount,
        'approval_code': approvalCode,
        'authorization_type': authorizationType,
        'authorize_uri': authorizeUri,
        'authorized': authorized,
        'authorized_amount': authorizedAmount,
        'authorized_at': authorizedAt?.toIso8601StringWithoutMilliseconds(),
        'branch': branch,
        'can_perform_void': canPerformVoid,
        'capturable': capturable,
        'capture': capture,
        'captured_amount': capturedAmount,
        'card': card?.toJson(),
        'created_at': createdAt.toIso8601StringWithoutMilliseconds(),
        'currency': currency.value,
        'customer': customer,
        'description': description,
        'device': device,
        'disputable': disputable,
        'dispute': dispute?.toJson(),
        'expired': expired,
        'expired_at': expiredAt?.toIso8601StringWithoutMilliseconds(),
        'expires_at': expiresAt?.toIso8601StringWithoutMilliseconds(),
        'failure_code': failureCode,
        'failure_message': failureMessage,
        'fee': fee,
        'fee_vat': feeVat,
        'funding_amount': fundingAmount,
        'funding_currency': fundingCurrency,
        'interest': interest,
        'interest_vat': interestVat,
        'ip': ip,
        'link': link,
        'linked_account': linkedAccount?.toJson(),
        'merchant_advice': merchantAdvice,
        'merchant_advice_code': merchantAdviceCode,
        'merchant_name': merchantName,
        'merchant_uid': merchantUid,
        'metadata': metadata,
        'missing_3ds_fields': missing3dsFields,
        'multi_capture': multiCapture,
        'net': net,
        'paid': paid,
        'paid_at': paidAt?.toIso8601StringWithoutMilliseconds(),
        'partially_refundable': partiallyRefundable,
        'platform_fee': platformFee?.toJson(),
        'refundable': refundable,
        'refunded_amount': refundedAmount,
        'refunds': refunds?.map((refund) => refund.toJson()).toList(),
        'return_uri': returnUri,
        'reversed': reversed,
        'reversed_at': reversedAt?.toIso8601StringWithoutMilliseconds(),
        'reversible': reversible,
        'schedule': schedule,
        'source': source?.toJson(),
        'status': status.name,
        'terminal': terminal,
        'transaction': transaction,
        'transaction_fees': transactionFees?.toJson(),
        'unmanaged_payment': unmanagedPayment?.toJson(),
        'voided': voided,
        'zero_interest_installments': zeroInterestInstallments,
        'authenticated_by': authenticatedBy?.value,
      };
}

// Named CardModel and not Card since in flutter we have a class named Card
class CardModel {
  final String object;
  final String id;
  final bool livemode;
  final String? location;
  final String bank;
  final String brand;
  final String? city;
  final String country;
  final DateTime createdAt;
  final bool deleted;
  final int expirationMonth;
  final int expirationYear;
  final String financing;
  final String fingerprint;
  final String? firstDigits;
  final String lastDigits;
  final String name;
  final String? phoneNumber;
  final String? postalCode;
  final bool securityCodeCheck;
  final String? state;
  final String? street1;
  final String? street2;
  final String? tokenizationMethod;

  CardModel({
    required this.object,
    required this.id,
    required this.livemode,
    this.location,
    required this.bank,
    required this.brand,
    this.city,
    required this.country,
    required this.createdAt,
    required this.deleted,
    required this.expirationMonth,
    required this.expirationYear,
    required this.financing,
    required this.fingerprint,
    this.firstDigits,
    required this.lastDigits,
    required this.name,
    this.phoneNumber,
    this.postalCode,
    required this.securityCodeCheck,
    this.state,
    this.street1,
    this.street2,
    this.tokenizationMethod,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      object: json['object'],
      id: json['id'],
      livemode: json['livemode'],
      location: json['location'],
      bank: json['bank'],
      brand: json['brand'],
      city: json['city'],
      country: json['country'],
      createdAt: DateTime.parse(json['created_at']),
      deleted: json['deleted'],
      expirationMonth: json['expiration_month'],
      expirationYear: json['expiration_year'],
      financing: json['financing'],
      fingerprint: json['fingerprint'],
      firstDigits: json['first_digits'],
      lastDigits: json['last_digits'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      postalCode: json['postal_code'],
      securityCodeCheck: json['security_code_check'],
      state: json['state'],
      street1: json['street1'],
      street2: json['street2'],
      tokenizationMethod: json['tokenization_method'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'id': id,
      'livemode': livemode,
      'location': location,
      'bank': bank,
      'brand': brand,
      'city': city,
      'country': country,
      'created_at': createdAt.toIso8601StringWithoutMilliseconds(),
      'deleted': deleted,
      'expiration_month': expirationMonth,
      'expiration_year': expirationYear,
      'financing': financing,
      'fingerprint': fingerprint,
      if (firstDigits != null) 'first_digits': firstDigits,
      'last_digits': lastDigits,
      'name': name,
      'phone_number': phoneNumber,
      'postal_code': postalCode,
      'security_code_check': securityCodeCheck,
      'state': state,
      'street1': street1,
      'street2': street2,
      if (tokenizationMethod != null) 'tokenization_method': tokenizationMethod,
    };
  }
}

class Dispute {
  final String id;
  final String object;
  final int amount;
  final String currency;
  final DisputeStatus status;
  final String charge;
  final DateTime? created;
  final DateTime? closedAt;
  final String? message;
  final Map<String, dynamic>? metadata;
  final List<Map<String, dynamic>>? documents;

  Dispute({
    required this.id,
    required this.object,
    required this.amount,
    required this.currency,
    required this.status,
    required this.charge,
    this.created,
    this.closedAt,
    this.message,
    this.metadata,
    this.documents,
  });

  factory Dispute.fromJson(Map<String, dynamic> json) {
    return Dispute(
      id: json['id'],
      object: json['object'],
      amount: json['amount'],
      currency: json['currency'],
      status: DisputeStatusExtension.fromString(json['status']),
      charge: json['charge'],
      created: json['created'] != null ? DateTime.parse(json['created']) : null,
      closedAt:
          json['closed_at'] != null ? DateTime.parse(json['closed_at']) : null,
      message: json['message'],
      metadata: json['metadata'] != null
          ? Map<String, dynamic>.from(json['metadata'])
          : null,
      documents: (json['documents'] as List?)
          ?.map((doc) => Map<String, dynamic>.from(doc))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'amount': amount,
      'currency': currency,
      'status': status.name,
      'charge': charge,
      'created': created?.toIso8601StringWithoutMilliseconds(),
      'closed_at': closedAt?.toIso8601StringWithoutMilliseconds(),
      'message': message,
      'metadata': metadata,
      'documents': documents,
    };
  }
}

class LinkedAccount {
  final String object;
  final String id;
  final bool livemode;
  final String location;
  final String registrationUri;
  final String returnUri;
  final String type;
  final String status;
  final String? lastDigits;
  final Map<String, dynamic> metadata;
  final String? failureCode;
  final String? failureMessage;
  final DateTime? registeredAt;
  final DateTime? expiresAt;
  final DateTime createdAt;

  LinkedAccount({
    required this.object,
    required this.id,
    required this.livemode,
    required this.location,
    required this.registrationUri,
    required this.returnUri,
    required this.type,
    required this.status,
    this.lastDigits,
    required this.metadata,
    this.failureCode,
    this.failureMessage,
    this.registeredAt,
    this.expiresAt,
    required this.createdAt,
  });

  factory LinkedAccount.fromJson(Map<String, dynamic> json) {
    return LinkedAccount(
      object: json['object'],
      id: json['id'],
      livemode: json['livemode'],
      location: json['location'],
      registrationUri: json['registration_uri'],
      returnUri: json['return_uri'],
      type: json['type'],
      status: json['status'],
      lastDigits: json['last_digits'],
      metadata: Map<String, dynamic>.from(json['metadata']),
      failureCode: json['failure_code'],
      failureMessage: json['failure_message'],
      registeredAt: json['registered_at'] != null
          ? DateTime.parse(json['registered_at'])
          : null,
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'id': id,
      'livemode': livemode,
      'location': location,
      'registration_uri': registrationUri,
      'return_uri': returnUri,
      'type': type,
      'status': status,
      'last_digits': lastDigits,
      'metadata': metadata,
      'failure_code': failureCode,
      'failure_message': failureMessage,
      'registered_at': registeredAt?.toIso8601StringWithoutMilliseconds(),
      'expires_at': expiresAt?.toIso8601StringWithoutMilliseconds(),
      'created_at': createdAt.toIso8601StringWithoutMilliseconds(),
    };
  }
}

class PlatformFee {
  final int? fixed;
  final int? amount;
  final String? percentage;

  PlatformFee({
    this.fixed,
    this.amount,
    this.percentage,
  });

  factory PlatformFee.fromJson(Map<String, dynamic> json) {
    return PlatformFee(
      fixed: json['fixed'],
      amount: json['amount'],
      percentage: json['percentage']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fixed': fixed,
      'amount': amount,
      'percentage': percentage,
    };
  }
}

class Refund {
  final String object;
  final String id;
  final String location;
  final bool livemode;
  final bool voided;
  final String currency;
  final int amount;
  final Map<String, dynamic> metadata;
  final String charge;
  final String? capture;
  final String? terminal;
  final String transaction;
  final String status;
  final int fundingAmount;
  final String fundingCurrency;
  final DateTime createdAt;
  final String? acquirerReferenceNumber;
  final String merchantName;
  final String merchantUid;
  final String? approvalCode;

  Refund({
    required this.object,
    required this.id,
    required this.location,
    required this.livemode,
    required this.voided,
    required this.currency,
    required this.amount,
    required this.metadata,
    required this.charge,
    this.capture,
    this.terminal,
    required this.transaction,
    required this.status,
    required this.fundingAmount,
    required this.fundingCurrency,
    required this.createdAt,
    this.acquirerReferenceNumber,
    required this.merchantName,
    required this.merchantUid,
    this.approvalCode,
  });

  factory Refund.fromJson(Map<String, dynamic> json) {
    return Refund(
      object: json['object'],
      id: json['id'],
      location: json['location'],
      livemode: json['livemode'],
      voided: json['voided'],
      currency: json['currency'],
      amount: json['amount'],
      metadata: Map<String, dynamic>.from(json['metadata'] ?? {}),
      charge: json['charge'],
      capture: json['capture'],
      terminal: json['terminal'],
      transaction: json['transaction'],
      status: json['status'],
      fundingAmount: json['funding_amount'],
      fundingCurrency: json['funding_currency'],
      createdAt: DateTime.parse(json['created_at']),
      acquirerReferenceNumber: json['acquirer_reference_number'],
      merchantName: json['merchant_name'],
      merchantUid: json['merchant_uid'],
      approvalCode: json['approval_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'id': id,
      'location': location,
      'livemode': livemode,
      'voided': voided,
      'currency': currency,
      'amount': amount,
      'metadata': metadata,
      'charge': charge,
      'capture': capture,
      'terminal': terminal,
      'transaction': transaction,
      'status': status,
      'funding_amount': fundingAmount,
      'funding_currency': fundingCurrency,
      'created_at': createdAt.toIso8601StringWithoutMilliseconds(),
      'acquirer_reference_number': acquirerReferenceNumber,
      'merchant_name': merchantName,
      'merchant_uid': merchantUid,
      'approval_code': approvalCode,
    };
  }
}

class TransactionFees {
  final String feeFlat;
  final String feeRate;
  final String vatRate;

  TransactionFees({
    required this.feeFlat,
    required this.feeRate,
    required this.vatRate,
  });

  factory TransactionFees.fromJson(Map<String, dynamic> json) {
    return TransactionFees(
      feeFlat: json['fee_flat'],
      feeRate: json['fee_rate'],
      vatRate: json['vat_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fee_flat': feeFlat,
      'fee_rate': feeRate,
      'vat_rate': vatRate,
    };
  }
}

class UnmanagedPayment {
  final String authorizationCode;
  final String backendName;
  final String iin;
  final String merchantReference;

  UnmanagedPayment({
    required this.authorizationCode,
    required this.backendName,
    required this.iin,
    required this.merchantReference,
  });

  factory UnmanagedPayment.fromJson(Map<String, dynamic> json) {
    return UnmanagedPayment(
      authorizationCode: json['authorization_code'],
      backendName: json['backend_name'],
      iin: json['iin'],
      merchantReference: json['merchant_reference'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authorization_code': authorizationCode,
      'backend_name': backendName,
      'iin': iin,
      'merchant_reference': merchantReference,
    };
  }
}
