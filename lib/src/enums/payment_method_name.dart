enum PaymentMethodName {
  card('card'),
  internetBankingBay('internet_banking_bay'),
  internetBankingBbl('internet_banking_bbl'),
  alipay('alipay'),
  alipayPlusMpm('alipayplus_mpm'),
  alipayPlusUpm('alipayplus_upm'),
  installmentBay('installment_bay'),
  installmentBbl('installment_bbl'),
  installmentFirstChoice('installment_first_choice'),
  installmentKbank('installment_kbank'),
  installmentKtc('installment_ktc'),
  installmentPaynextExtraJumpapp('installment_paynext_extra_jumpapp'),
  installmentPaynextExtraQr('installment_paynext_extra_qr'),
  installmentScb('installment_scb'),
  installmentUob('installment_uob'),
  installmentTtb('installment_ttb'),
  installmentWlbBay('installment_wlb_bay'),
  installmentWlbBbl('installment_wlb_bbl'),
  installmentWlbFirstChoice('installment_wlb_first_choice'),
  installmentWlbKbank('installment_wlb_kbank'),
  installmentWlbKtc('installment_wlb_ktc'),
  installmentWlbScb('installment_wlb_scb'),
  installmentWlbTtb('installment_wlb_ttb'),
  installmentWlbUob('installment_wlb_uob'),
  mobileBankingScb('mobile_banking_scb'),
  mobileBankingKbank('mobile_banking_kbank'),
  mobileBankingBbl('mobile_banking_bbl'),
  mobileBankingBay('mobile_banking_bay'),
  mobileBankingKtb('mobile_banking_ktb'),
  mobileBankingOcbc('mobile_banking_ocbc'),
  mobileBankingOcbcPao('mobile_banking_ocbc_pao'),
  barcodeAlipay('barcode_alipay'),
  billPaymentTescoLotus('bill_payment_tesco_lotus'),
  econtext('econtext'),
  virtualAccount('virtual_account'),
  truemoney('truemoney'),
  truemoneyJumpapp('truemoney_jumpapp'),
  truemoneyQr('truemoney_qr'),
  promptpay('promptpay'),
  pointsCiti('points_citi'),
  paynow('paynow'),
  qrCodeUpi('qr_code_upi'),
  fpx('fpx'),
  alipayCn('alipay_cn'),
  alipayHk('alipay_hk'),
  bkash('bkash'),
  dana('dana'),
  gcash('gcash'),
  easypaisa('easypaisa'),
  kakaopay('kakaopay'),
  touchNGo('touch_n_go'),
  rabbitLinepay('rabbit_linepay'),
  grabpay('grabpay'),
  boost('boost'),
  shopeePay('shopeepay'),
  shopeePayJumpapp('shopeepay_jumpapp'),
  paypay('paypay'),
  installmentMbb('installment_mbb'),
  atome('atome'),
  atomeQr('atome_qr'),
  wechatPay('wechat_pay'),
  wechatPayMpm('wechat_pay_mpm'),
  wechatPayUpm('wechat_pay_upm'),
  directDebitBay('direct_debit_bay'),
  directDebitKbank('direct_debit_kbank'),
  directDebitKtb('direct_debit_ktb'),
  directDebitScb('direct_debit_scb'),
  duitnowObw('duitnow_obw'),
  duitnowQr('duitnow_qr'),

  /// Represents an unknown payment method.
  /// This value is used as a fallback when a payment method is received from the backend
  /// that does not match any of the defined enums. This helps to prevent crashes
  /// due to unrecognized payment methods and allows for graceful handling of such cases.
  unknown('unknown');

  final String value;

  const PaymentMethodName(this.value);
}

extension PaymentMethodNameExtension on PaymentMethodName {
  static PaymentMethodName fromString(String methodName) {
    return PaymentMethodName.values.firstWhere(
      (method) => method.value.toLowerCase() == methodName.toLowerCase(),
      orElse: () => PaymentMethodName.unknown,
    );
  }
}
