// Enum for Currency
import 'package:omise_dart/src/exceptions/omise_api_exception.dart';

enum Currency { THB, JPY, USD, EUR, GBP, SGD, AUD, CHF, CNY, DKK, HKD }

extension CurrencyExtension on Currency {
  static Currency fromString(String value) {
    switch (value.toUpperCase()) {
      case 'THB':
        return Currency.THB;
      case 'JPY':
        return Currency.JPY;
      case 'USD':
        return Currency.USD;
      case 'EUR':
        return Currency.EUR;
      case 'GBP':
        return Currency.GBP;
      case 'SGD':
        return Currency.SGD;
      case 'AUD':
        return Currency.AUD;
      case 'CHF':
        return Currency.CHF;
      case 'CNY':
        return Currency.CNY;
      case 'DKK':
        return Currency.DKK;
      case 'HKD':
        return Currency.HKD;
      default:
        throw OmiseApiException(message: 'Unknown currency: $value');
    }
  }
}
