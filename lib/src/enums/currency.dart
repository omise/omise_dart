// Enum for Currency
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';

enum Currency { thb, jpy, usd, eur, gbp, sgd, aud, chf, cny, dkk, hkd }

extension CurrencyExtension on Currency {
  static Currency fromString(String value) {
    switch (value.toUpperCase()) {
      case 'THB':
        return Currency.thb;
      case 'JPY':
        return Currency.jpy;
      case 'USD':
        return Currency.usd;
      case 'EUR':
        return Currency.eur;
      case 'GBP':
        return Currency.gbp;
      case 'SGD':
        return Currency.sgd;
      case 'AUD':
        return Currency.aud;
      case 'CHF':
        return Currency.chf;
      case 'CNY':
        return Currency.cny;
      case 'DKK':
        return Currency.dkk;
      case 'HKD':
        return Currency.hkd;
      default:
        throw OmiseApiException(message: 'Unknown currency: $value');
    }
  }
}
