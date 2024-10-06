enum PaymentMethodName {
  card,
  internetBankingBay,
  internetBankingBbl,
  alipay,
  alipayPlusMpm,
  alipayPlusUpm,
  installmentBay,
  installmentBbl,
  installmentFirstChoice,
  installmentKbank,
  installmentKtc,
  installmentPaynextExtraJumpapp,
  installmentPaynextExtraQr,
  installmentScb,
  installmentUob,
  installmentTtb,
  installmentWlbBay,
  installmentWlbBbl,
  installmentWlbFirstChoice,
  installmentWlbKbank,
  installmentWlbKtc,
  installmentWlbScb,
  installmentWlbTtb,
  installmentWlbUob,
  mobileBankingScb,
  mobileBankingKbank,
  mobileBankingBbl,
  mobileBankingBay,
  mobileBankingKtb,
  mobileBankingOcbc,
  mobileBankingOcbcPao,
  barcodeAlipay,
  billPaymentTescoLotus,
  econtext,
  virtualAccount,
  truemoney,
  truemoneyJumpapp,
  truemoneyQr,
  promptpay,
  pointsCiti,
  paynow,
  qrCodeUpi,
  fpx,
  alipayCn,
  alipayHk,
  bkash,
  dana,
  gcash,
  easypaisa,
  kakaopay,
  touchNGo,
  rabbitLinepay,
  grabpay,
  boost,
  shopeePay,
  shopeePayJumpapp,
  paypay,
  installmentMbb,
  atome,
  atomeQr,
  wechatPay,
  wechatPayMpm,
  wechatPayUpm,
  directDebitBay,
  directDebitKbank,
  directDebitKtb,
  directDebitScb,
  duitnowObw,
  duitnowQr,
}

extension PaymentMethodNameExtension on PaymentMethodName {
  static PaymentMethodName fromString(String value) {
    switch (value) {
      case 'card':
        return PaymentMethodName.card;
      case 'internet_banking_bay':
        return PaymentMethodName.internetBankingBay;
      case 'internet_banking_bbl':
        return PaymentMethodName.internetBankingBbl;
      case 'alipay':
        return PaymentMethodName.alipay;
      case 'alipayplus_mpm':
        return PaymentMethodName.alipayPlusMpm;
      case 'alipayplus_upm':
        return PaymentMethodName.alipayPlusUpm;
      case 'installment_bay':
        return PaymentMethodName.installmentBay;
      case 'installment_bbl':
        return PaymentMethodName.installmentBbl;
      case 'installment_first_choice':
        return PaymentMethodName.installmentFirstChoice;
      case 'installment_kbank':
        return PaymentMethodName.installmentKbank;
      case 'installment_ktc':
        return PaymentMethodName.installmentKtc;
      case 'installment_paynext_extra_jumpapp':
        return PaymentMethodName.installmentPaynextExtraJumpapp;
      case 'installment_paynext_extra_qr':
        return PaymentMethodName.installmentPaynextExtraQr;
      case 'installment_scb':
        return PaymentMethodName.installmentScb;
      case 'installment_uob':
        return PaymentMethodName.installmentUob;
      case 'installment_ttb':
        return PaymentMethodName.installmentTtb;
      case 'installment_wlb_bay':
        return PaymentMethodName.installmentWlbBay;
      case 'installment_wlb_bbl':
        return PaymentMethodName.installmentWlbBbl;
      case 'installment_wlb_first_choice':
        return PaymentMethodName.installmentWlbFirstChoice;
      case 'installment_wlb_kbank':
        return PaymentMethodName.installmentWlbKbank;
      case 'installment_wlb_ktc':
        return PaymentMethodName.installmentWlbKtc;
      case 'installment_wlb_scb':
        return PaymentMethodName.installmentWlbScb;
      case 'installment_wlb_ttb':
        return PaymentMethodName.installmentWlbTtb;
      case 'installment_wlb_uob':
        return PaymentMethodName.installmentWlbUob;
      case 'mobile_banking_scb':
        return PaymentMethodName.mobileBankingScb;
      case 'mobile_banking_kbank':
        return PaymentMethodName.mobileBankingKbank;
      case 'mobile_banking_bbl':
        return PaymentMethodName.mobileBankingBbl;
      case 'mobile_banking_bay':
        return PaymentMethodName.mobileBankingBay;
      case 'mobile_banking_ktb':
        return PaymentMethodName.mobileBankingKtb;
      case 'mobile_banking_ocbc':
        return PaymentMethodName.mobileBankingOcbc;
      case 'mobile_banking_ocbc_pao':
        return PaymentMethodName.mobileBankingOcbcPao;
      case 'barcode_alipay':
        return PaymentMethodName.barcodeAlipay;
      case 'bill_payment_tesco_lotus':
        return PaymentMethodName.billPaymentTescoLotus;
      case 'econtext':
        return PaymentMethodName.econtext;
      case 'virtual_account':
        return PaymentMethodName.virtualAccount;
      case 'truemoney':
        return PaymentMethodName.truemoney;
      case 'truemoney_jumpapp':
        return PaymentMethodName.truemoneyJumpapp;
      case 'truemoney_qr':
        return PaymentMethodName.truemoneyQr;
      case 'promptpay':
        return PaymentMethodName.promptpay;
      case 'points_citi':
        return PaymentMethodName.pointsCiti;
      case 'paynow':
        return PaymentMethodName.paynow;
      case 'qr_code_upi':
        return PaymentMethodName.qrCodeUpi;
      case 'fpx':
        return PaymentMethodName.fpx;
      case 'alipay_cn':
        return PaymentMethodName.alipayCn;
      case 'alipay_hk':
        return PaymentMethodName.alipayHk;
      case 'bkash':
        return PaymentMethodName.bkash;
      case 'dana':
        return PaymentMethodName.dana;
      case 'gcash':
        return PaymentMethodName.gcash;
      case 'easypaisa':
        return PaymentMethodName.easypaisa;
      case 'kakaopay':
        return PaymentMethodName.kakaopay;
      case 'touch_n_go':
        return PaymentMethodName.touchNGo;
      case 'rabbit_linepay':
        return PaymentMethodName.rabbitLinepay;
      case 'grabpay':
        return PaymentMethodName.grabpay;
      case 'boost':
        return PaymentMethodName.boost;
      case 'shopeepay':
        return PaymentMethodName.shopeePay;
      case 'shopeepay_jumpapp':
        return PaymentMethodName.shopeePayJumpapp;
      case 'paypay':
        return PaymentMethodName.paypay;
      case 'installment_mbb':
        return PaymentMethodName.installmentMbb;
      case 'atome':
        return PaymentMethodName.atome;
      case 'atome_qr':
        return PaymentMethodName.atomeQr;
      case 'wechat_pay':
        return PaymentMethodName.wechatPay;
      case 'wechat_pay_mpm':
        return PaymentMethodName.wechatPayMpm;
      case 'wechat_pay_upm':
        return PaymentMethodName.wechatPayUpm;
      case 'direct_debit_bay':
        return PaymentMethodName.directDebitBay;
      case 'direct_debit_kbank':
        return PaymentMethodName.directDebitKbank;
      case 'direct_debit_ktb':
        return PaymentMethodName.directDebitKtb;
      case 'direct_debit_scb':
        return PaymentMethodName.directDebitScb;
      case 'duitnow_obw':
        return PaymentMethodName.duitnowObw;
      case 'duitnow_qr':
        return PaymentMethodName.duitnowQr;
      default:
        throw ArgumentError('Unknown payment method name: $value');
    }
  }
}
