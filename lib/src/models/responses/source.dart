import 'package:omise_dart/src/enums/absorption_type.dart';
import 'package:omise_dart/src/enums/bank.dart';
import 'package:omise_dart/src/enums/charge_status.dart';
import 'package:omise_dart/src/enums/currency.dart';
import 'package:omise_dart/src/enums/payment_method_name.dart';
import 'package:omise_dart/src/models/requests/create_source_request.dart';
import 'package:omise_dart/src/models/responses/base_response.dart';
import 'package:omise_dart/src/extensions/date_time_no_milliseconds.dart';

class Source extends BaseResponse {
  final AbsorptionType? absorptionType;
  final int amount;
  final Bank? bank;
  final String? barcode;
  final BillingAddress? billing;
  final ChargeStatus chargeStatus;
  final DateTime createdAt;
  final Currency currency;
  final List? discounts;
  final String? email;
  final String flow;
  final int? installmentTerm;
  final String? ip;
  final List<Item>? items;
  final String? name;
  final String? phoneNumber;
  final String? platformType;
  final String? promotionCode;
  final ProviderReferences? providerReferences;
  final int? receiptAmount;
  final References? references;
  final Barcode? scannableCode;
  final ShippingAddress? shipping;
  final String? storeId;
  final String? storeName;
  final String? terminalId;
  final PaymentMethodName type;
  final bool? zeroInterestInstallments;

  Source({
    required super.object,
    required super.id,
    required super.livemode,
    super.location,
    this.absorptionType,
    required this.amount,
    this.bank,
    this.barcode,
    this.billing,
    required this.chargeStatus,
    required this.createdAt,
    required this.currency,
    this.discounts,
    this.email,
    required this.flow,
    this.installmentTerm,
    this.ip,
    this.items,
    this.name,
    this.phoneNumber,
    this.platformType,
    this.promotionCode,
    this.providerReferences,
    this.receiptAmount,
    this.references,
    this.scannableCode,
    this.shipping,
    this.storeId,
    this.storeName,
    this.terminalId,
    required this.type,
    this.zeroInterestInstallments,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      object: json['object'],
      id: json['id'],
      livemode: json['livemode'],
      location: json['location'],
      absorptionType:
          AbsorptionTypeExtension.fromString(json['absorption_type']),
      amount: json['amount'],
      bank: BankExtension.fromString(json['bank']),
      barcode: json['barcode'],
      billing: json['billing'] != null
          ? BillingAddress.fromJson(json['billing'])
          : null,
      chargeStatus: ChargeStatusExtension.fromString(json['charge_status']),
      createdAt: DateTime.parse(json['created_at']),
      currency: CurrencyExtension.fromString(json['currency']),
      discounts: json['discounts'] != null ? (json['discounts'] as List) : null,
      email: json['email'],
      flow: json['flow'],
      installmentTerm: json['installment_term'],
      ip: json['ip'],
      items: json['items'] != null
          ? (json['items'] as List).map((e) => Item.fromJson(e)).toList()
          : null,
      name: json['name'],
      phoneNumber: json['phone_number'],
      platformType: json['platform_type'],
      promotionCode: json['promotion_code'],
      providerReferences: json['provider_references'] != null
          ? ProviderReferences.fromJson(json['provider_references'])
          : null,
      receiptAmount: json['receipt_amount'],
      references: json['references'] != null
          ? References.fromJson(json['references'])
          : null,
      scannableCode: json['scannable_code'] != null
          ? Barcode.fromJson(json['scannable_code'])
          : null,
      shipping: json['shipping'] != null
          ? ShippingAddress.fromJson(json['shipping'])
          : null,
      storeId: json['store_id'],
      storeName: json['store_name'],
      terminalId: json['terminal_id'],
      type: PaymentMethodNameExtension.fromString(json['type']),
      zeroInterestInstallments: json['zero_interest_installments'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseResponse = super.toJson();
    baseResponse.addAll({
      'absorption_type': absorptionType?.value,
      'amount': amount,
      'bank': bank?.value,
      'barcode': barcode,
      'billing': billing?.toJson(),
      'charge_status': chargeStatus.name,
      'created_at': createdAt.toIso8601StringWithoutMilliseconds(),
      'currency': currency.value,
      'discounts': discounts,
      'email': email,
      'flow': flow,
      'installment_term': installmentTerm,
      'ip': ip,
      'items': items?.map((e) => e.toJson()).toList(),
      'name': name,
      'phone_number': phoneNumber,
      'platform_type': platformType,
      'promotion_code': promotionCode,
      'provider_references': providerReferences?.toJson(),
      'receipt_amount': receiptAmount,
      'references': references?.toJson(),
      'scannable_code': scannableCode?.toJson(),
      'shipping': shipping?.toJson(),
      'store_id': storeId,
      'store_name': storeName,
      'terminal_id': terminalId,
      'type': type.value,
      'zero_interest_installments': zeroInterestInstallments,
    });
    return baseResponse;
  }
}

class ProviderReferences {
  final String? referenceNumber1;
  final String? referenceNumber2;
  final String? buyerName;

  ProviderReferences({
    this.referenceNumber1,
    this.referenceNumber2,
    this.buyerName,
  });

  factory ProviderReferences.fromJson(Map<String, dynamic> json) {
    return ProviderReferences(
      referenceNumber1: json['reference_number_1'],
      referenceNumber2: json['reference_number_2'],
      buyerName: json['buyer_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'reference_number_1': referenceNumber1,
        'reference_number_2': referenceNumber2,
        'buyer_name': buyerName,
      };
}

class References {
  final DateTime? expiresAt;
  final String? deviceId;
  final int? customerAmount;
  final String? customerCurrency;
  final double? customerExchangeRate;
  final String? omiseTaxId;
  final String? referenceNumber1;
  final String? referenceNumber2;
  final String? barcode;
  final String? paymentCode;
  final String? vaCode;

  References({
    this.expiresAt,
    this.deviceId,
    this.customerAmount,
    this.customerCurrency,
    this.customerExchangeRate,
    this.omiseTaxId,
    this.referenceNumber1,
    this.referenceNumber2,
    this.barcode,
    this.paymentCode,
    this.vaCode,
  });

  factory References.fromJson(Map<String, dynamic> json) {
    return References(
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : null,
      deviceId: json['device_id'],
      customerAmount: json['customer_amount'],
      customerCurrency: json['customer_currency'],
      customerExchangeRate:
          (json['customer_exchange_rate'] as num?)?.toDouble(),
      omiseTaxId: json['omise_tax_id'],
      referenceNumber1: json['reference_number_1'],
      referenceNumber2: json['reference_number_2'],
      barcode: json['barcode'],
      paymentCode: json['payment_code'],
      vaCode: json['va_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expires_at': expiresAt?.toIso8601StringWithoutMilliseconds(),
      'device_id': deviceId,
      'customer_amount': customerAmount,
      'customer_currency': customerCurrency,
      'customer_exchange_rate': customerExchangeRate,
      'omise_tax_id': omiseTaxId,
      'reference_number_1': referenceNumber1,
      'reference_number_2': referenceNumber2,
      'barcode': barcode,
      'payment_code': paymentCode,
      'va_code': vaCode,
    };
  }
}

class Document extends BaseResponse {
  final bool deleted;
  final String filename;
  final String kind;
  final String downloadUri;
  final DateTime createdAt;

  Document({
    required super.object,
    required super.id,
    required super.livemode,
    super.location,
    required this.deleted,
    required this.filename,
    required this.kind,
    required this.downloadUri,
    required this.createdAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      object: json['object'],
      livemode: json['livemode'],
      id: json['id'],
      location: json['location'],
      deleted: json['deleted'],
      filename: json['filename'],
      kind: json['kind'],
      downloadUri: json['download_uri'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    baseJson.addAll({
      'deleted': deleted,
      'filename': filename,
      'kind': kind,
      'download_uri': downloadUri,
      'created_at': createdAt.toIso8601StringWithoutMilliseconds(),
    });
    return baseJson;
  }
}

class Barcode {
  final String object;
  final String? type;
  final Document? image;

  Barcode({
    this.object = "barcode",
    this.type,
    this.image,
  });

  factory Barcode.fromJson(Map<String, dynamic> json) {
    return Barcode(
      object: json['object'],
      type: json['type'],
      image: json['image'] != null ? Document.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'type': type,
      'image': image?.toJson(),
    };
  }
}
