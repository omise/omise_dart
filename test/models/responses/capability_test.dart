import 'package:omise_dart/src/enums/card_brand.dart';
import 'package:omise_dart/src/enums/fpx_bank_code.dart';
import 'package:omise_dart/src/enums/payment_method_name.dart';
import 'package:omise_dart/src/enums/tokenization_method.dart';
import 'package:omise_dart/src/models/responses/capability.dart';
import 'package:test/test.dart';
import 'package:omise_dart/src/enums/currency.dart';

import 'mock_data.dart/capability_mock.dart';

void main() {
  group('Capability model tests', () {
    test('Capability fromJson() should parse correctly', () {
      final capability = Capability.fromJson(CapabilityMock.getCapability);

      expect(capability.object, 'capability');
      expect(capability.location, '/capability');
      expect(capability.banks, ['bbl', 'kbank']);
      expect(capability.tokenizationMethods,
          [TokenizationMethod.googlepay, TokenizationMethod.applepay]);
      expect(capability.zeroInterestInstallments, true);
      expect(capability.country, 'TH');

      // Test limits
      expect(capability.limits.chargeAmount.max, 100000);
      expect(capability.limits.chargeAmount.min, 1000);
      expect(capability.limits.transferAmount.max, 50000);
      expect(capability.limits.transferAmount.min, 500);
      expect(capability.limits.installmentAmount.min, 5000);

      // Test payment methods
      expect(capability.paymentMethods.length, 1);
      final paymentMethod = capability.paymentMethods[0];
      expect(paymentMethod.object, 'payment_method');
      expect(paymentMethod.name, PaymentMethodName.card);
      expect(paymentMethod.currencies, [Currency.thb, Currency.usd]);
      expect(paymentMethod.cardBrands, [CardBrand.visa, CardBrand.masterCard]);
      expect(paymentMethod.installmentTerms, [3, 6]);
      expect(paymentMethod.banks.first.code, FpxBankCode.affin);
      expect(paymentMethod.provider, 'visa');
    });

    test('Capability toJson() should serialize correctly', () {
      final capability = Capability(
        object: 'capability',
        location: '/capability/123',
        banks: ['bbl', 'kbank'],
        limits: Limits(
          chargeAmount: Amount(max: 10000, min: 100),
          transferAmount: Amount(max: 5000, min: 50),
          installmentAmount: InstallmentAmount(min: 500),
        ),
        paymentMethods: [
          PaymentMethod(
            object: 'payment_method',
            name: PaymentMethodName.card,
            currencies: [Currency.thb, Currency.usd],
            cardBrands: [CardBrand.visa, CardBrand.masterCard],
            installmentTerms: [3, 6],
            banks: [Bank(code: FpxBankCode.affin, name: "name", active: true)],
            provider: 'visa',
          )
        ],
        tokenizationMethods: [
          TokenizationMethod.googlepay,
          TokenizationMethod.applepay
        ],
        zeroInterestInstallments: true,
        country: 'TH',
      );

      final json = capability.toJson();

      expect(json['object'], 'capability');
      expect(json['location'], '/capability/123');
      expect(json['banks'], ['bbl', 'kbank']);
      expect(json['tokenization_methods'], ['googlepay', 'applepay']);
      expect(json['zero_interest_installments'], true);
      expect(json['country'], 'TH');

      // Test limits
      expect(json['limits']['charge_amount']['max'], 10000);
      expect(json['limits']['charge_amount']['min'], 100);
      expect(json['limits']['transfer_amount']['max'], 5000);
      expect(json['limits']['transfer_amount']['min'], 50);
      expect(json['limits']['installment_amount']['min'], 500);

      // Test payment methods
      expect(json['payment_methods'].length, 1);
      final paymentMethodJson = json['payment_methods'][0];
      expect(paymentMethodJson['object'], 'payment_method');
      expect(paymentMethodJson['name'], 'card');
      expect(paymentMethodJson['currencies'], ['THB', 'USD']);
      expect(paymentMethodJson['card_brands'], ['Visa', 'MasterCard']);
      expect(paymentMethodJson['installment_terms'], [3, 6]);
      expect(paymentMethodJson['banks'], [
        {'code': 'affin', 'name': 'name', 'active': true}
      ]);
      expect(paymentMethodJson['provider'], 'visa');
    });

    test('Limits fromJson() should parse correctly', () {
      final json = {
        'charge_amount': {'max': 10000, 'min': 100},
        'transfer_amount': {'max': 5000, 'min': 50},
        'installment_amount': {'min': 500},
      };

      final limits = Limits.fromJson(json);

      expect(limits.chargeAmount.max, 10000);
      expect(limits.chargeAmount.min, 100);
      expect(limits.transferAmount.max, 5000);
      expect(limits.transferAmount.min, 50);
      expect(limits.installmentAmount.min, 500);
    });

    test('Limits toJson() should serialize correctly', () {
      final limits = Limits(
        chargeAmount: Amount(max: 10000, min: 100),
        transferAmount: Amount(max: 5000, min: 50),
        installmentAmount: InstallmentAmount(min: 500),
      );

      final json = limits.toJson();

      expect(json['charge_amount']['max'], 10000);
      expect(json['charge_amount']['min'], 100);
      expect(json['transfer_amount']['max'], 5000);
      expect(json['transfer_amount']['min'], 50);
      expect(json['installment_amount']['min'], 500);
    });
  });
}
