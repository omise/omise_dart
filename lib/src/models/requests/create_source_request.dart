import 'package:omise_dart/src/enums/currency.dart';
import 'package:omise_dart/src/enums/payment_method_name.dart';

class CreateSourceRequest {
  // Required fields
  int amount;
  Currency currency;
  PaymentMethodName type;

  // Optional fields
  String? bank;
  String? barcode;
  BillingAddress? billing;
  String? email;
  int? installmentTerm;
  String? ip;
  List<Item>? items;
  String? phoneNumber;
  String? name;
  String? platformType;
  String? promotionCode;
  ShippingAddress? shipping;
  String? storeId;
  String? storeName;
  String? terminalId;
  bool? zeroInterestInstallments;

  CreateSourceRequest({
    required this.amount,
    required this.currency,
    required this.type,
    this.bank,
    this.barcode,
    this.billing,
    this.email,
    this.installmentTerm,
    this.ip,
    this.items,
    this.phoneNumber,
    this.name,
    this.platformType,
    this.promotionCode,
    this.shipping,
    this.storeId,
    this.storeName,
    this.terminalId,
    this.zeroInterestInstallments,
  });

  factory CreateSourceRequest.fromJson(Map<String, dynamic> json) {
    return CreateSourceRequest(
      amount: json['amount'],
      currency: CurrencyExtension.fromString(json['currency']),
      type: PaymentMethodNameExtension.fromString(json['type']),
      bank: json['bank'],
      barcode: json['barcode'],
      billing: json['billing'] != null
          ? BillingAddress.fromJson(json['billing'])
          : null,
      email: json['email'],
      installmentTerm: json['installment_term'],
      ip: json['ip'],
      items: json['items'] != null
          ? (json['items'] as List).map((item) => Item.fromJson(item)).toList()
          : null,
      phoneNumber: json['phone_number'],
      name: json['name'],
      platformType: json['platform_type'],
      promotionCode: json['promotion_code'],
      shipping: json['shipping'] != null
          ? ShippingAddress.fromJson(json['shipping'])
          : null,
      storeId: json['store_id'],
      storeName: json['store_name'],
      terminalId: json['terminal_id'],
      zeroInterestInstallments: json['zero_interest_installments'],
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency.value,
        'type': type.value,
        'bank': bank,
        'barcode': barcode,
        'billing': billing?.toJson(),
        'email': email,
        'installment_term': installmentTerm,
        'ip': ip,
        'items': items?.map((item) => item.toJson()).toList(),
        'phone_number': phoneNumber,
        'name': name,
        'platform_type': platformType,
        'promotion_code': promotionCode,
        'shipping': shipping?.toJson(),
        'store_id': storeId,
        'store_name': storeName,
        'terminal_id': terminalId,
        'zero_interest_installments': zeroInterestInstallments,
      };
}

// Supporting classes for BillingAddress, ShippingAddress, and Item
class BillingAddress {
  String? country;
  String? city;
  String? postalCode;
  String? state;
  String? street1;
  String? street2;

  BillingAddress({
    this.country,
    this.city,
    this.postalCode,
    this.state,
    this.street1,
    this.street2,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> data) {
    return BillingAddress(
      country: data['country'],
      city: data['city'],
      postalCode: data['postal_code'],
      state: data['state'],
      street1: data['street1'],
      street2: data['street2'],
    );
  }

  Map<String, dynamic> toJson() => {
        'country': country,
        'city': city,
        'postal_code': postalCode,
        'state': state,
        'street1': street1,
        'street2': street2,
      };
}

class ShippingAddress {
  String? country;
  String? city;
  String? postalCode;
  String? state;
  String? street1;
  String? street2;

  ShippingAddress({
    this.country,
    this.city,
    this.postalCode,
    this.state,
    this.street1,
    this.street2,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> data) {
    return ShippingAddress(
      country: data['country'],
      city: data['city'],
      postalCode: data['postal_code'],
      state: data['state'],
      street1: data['street1'],
      street2: data['street2'],
    );
  }

  Map<String, dynamic> toJson() => {
        'country': country,
        'city': city,
        'postal_code': postalCode,
        'state': state,
        'street1': street1,
        'street2': street2,
      };
}

class Item {
  int amount;
  String sku;
  String name;
  int quantity;
  String? category;
  String? brand;
  String? itemUri;
  String? imageUri;

  Item({
    required this.amount,
    required this.sku,
    required this.name,
    required this.quantity,
    this.category,
    this.brand,
    this.itemUri,
    this.imageUri,
  });

  factory Item.fromJson(Map<String, dynamic> data) {
    return Item(
      amount: data['amount'],
      sku: data['sku'],
      name: data['name'],
      quantity: data['quantity'],
      category: data['category'],
      brand: data['brand'],
      itemUri: data['item_uri'],
      imageUri: data['image_uri'],
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'sku': sku,
        'name': name,
        'quantity': quantity,
        'category': category,
        'brand': brand,
        'item_uri': itemUri,
        'image_uri': imageUri,
      };
}
