import 'package:test/test.dart';
import 'package:omise_dart/src/enums/payment_method_name.dart';

void main() {
  group('PaymentMethodName enum tests', () {
    test(
        'fromString() should return the correct enum value for known payment method names',
        () {
      expect(PaymentMethodNameExtension.fromString('card'),
          equals(PaymentMethodName.card));
      expect(PaymentMethodNameExtension.fromString('internet_banking_bay'),
          equals(PaymentMethodName.internetBankingBay));
      expect(PaymentMethodNameExtension.fromString('internet_banking_bbl'),
          equals(PaymentMethodName.internetBankingBbl));
      expect(PaymentMethodNameExtension.fromString('alipay'),
          equals(PaymentMethodName.alipay));
      expect(PaymentMethodNameExtension.fromString('installment_bay'),
          equals(PaymentMethodName.installmentBay));
      expect(PaymentMethodNameExtension.fromString('installment_kbank'),
          equals(PaymentMethodName.installmentKbank));
      expect(PaymentMethodNameExtension.fromString('installment_ktc'),
          equals(PaymentMethodName.installmentKtc));
      expect(PaymentMethodNameExtension.fromString('installment_bbl'),
          equals(PaymentMethodName.installmentBbl));
      expect(PaymentMethodNameExtension.fromString('installment_first_choice'),
          equals(PaymentMethodName.installmentFirstChoice));
      expect(PaymentMethodNameExtension.fromString('bill_payment_tesco_lotus'),
          equals(PaymentMethodName.billPaymentTescoLotus));
      expect(PaymentMethodNameExtension.fromString('barcode_alipay'),
          equals(PaymentMethodName.barcodeAlipay));
      expect(PaymentMethodNameExtension.fromString('alipay_cn'),
          equals(PaymentMethodName.alipayCn));
      expect(PaymentMethodNameExtension.fromString('alipay_hk'),
          equals(PaymentMethodName.alipayHk));
      expect(PaymentMethodNameExtension.fromString('alipayplus_mpm'),
          equals(PaymentMethodName.alipayPlusMpm));
      expect(PaymentMethodNameExtension.fromString('alipayplus_upm'),
          equals(PaymentMethodName.alipayPlusUpm));
      expect(PaymentMethodNameExtension.fromString('atome'),
          equals(PaymentMethodName.atome));
      expect(PaymentMethodNameExtension.fromString('atome_qr'),
          equals(PaymentMethodName.atomeQr));
      expect(PaymentMethodNameExtension.fromString('dana'),
          equals(PaymentMethodName.dana));
      expect(PaymentMethodNameExtension.fromString('direct_debit_bay'),
          equals(PaymentMethodName.directDebitBay));
      expect(PaymentMethodNameExtension.fromString('direct_debit_kbank'),
          equals(PaymentMethodName.directDebitKbank));
      expect(PaymentMethodNameExtension.fromString('direct_debit_ktb'),
          equals(PaymentMethodName.directDebitKtb));
      expect(PaymentMethodNameExtension.fromString('direct_debit_scb'),
          equals(PaymentMethodName.directDebitScb));
      expect(PaymentMethodNameExtension.fromString('gcash'),
          equals(PaymentMethodName.gcash));
      expect(PaymentMethodNameExtension.fromString('grabpay'),
          equals(PaymentMethodName.grabpay));
      expect(PaymentMethodNameExtension.fromString('installment_scb'),
          equals(PaymentMethodName.installmentScb));
      expect(PaymentMethodNameExtension.fromString('installment_ttb'),
          equals(PaymentMethodName.installmentTtb));
      expect(PaymentMethodNameExtension.fromString('installment_uob'),
          equals(PaymentMethodName.installmentUob));
      expect(PaymentMethodNameExtension.fromString('kakaopay'),
          equals(PaymentMethodName.kakaopay));
      expect(PaymentMethodNameExtension.fromString('mobile_banking_bay'),
          equals(PaymentMethodName.mobileBankingBay));
      expect(PaymentMethodNameExtension.fromString('mobile_banking_bbl'),
          equals(PaymentMethodName.mobileBankingBbl));
      expect(PaymentMethodNameExtension.fromString('mobile_banking_kbank'),
          equals(PaymentMethodName.mobileBankingKbank));
      expect(PaymentMethodNameExtension.fromString('mobile_banking_ktb'),
          equals(PaymentMethodName.mobileBankingKtb));
      expect(PaymentMethodNameExtension.fromString('mobile_banking_scb'),
          equals(PaymentMethodName.mobileBankingScb));
      expect(PaymentMethodNameExtension.fromString('promptpay'),
          equals(PaymentMethodName.promptpay));
      expect(PaymentMethodNameExtension.fromString('rabbit_linepay'),
          equals(PaymentMethodName.rabbitLinepay));
    });

    test(
        'fromString() should return unknown enum for unknown payment method names',
        () {
      expect(PaymentMethodNameExtension.fromString('unknown_method'),
          equals(PaymentMethodName.unknown));
    });

    test('fromString() should be case-insensitive', () {
      expect(PaymentMethodNameExtension.fromString('card'),
          equals(PaymentMethodName.card));
      expect(PaymentMethodNameExtension.fromString('alipayplus_upm'),
          equals(PaymentMethodName.alipayPlusUpm));
      expect(PaymentMethodNameExtension.fromString('mobile_banking_BBl'),
          equals(PaymentMethodName.mobileBankingBbl));
    });
  });
}
