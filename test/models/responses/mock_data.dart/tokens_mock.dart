class TokensMock {
  static final createTokenSuccess = {
    "object": "token",
    "id": "tokn_test_6143sao9orm05j2t78j",
    "livemode": false,
    "location": "https://vault.omise.co/tokens/tokn_test_6143sao9orm05j2t78j",
    "used": false,
    "charge_status": "unknown",
    "card": {
      "object": "card",
      "id": "card_test_6143sao8wybyfayleob",
      "livemode": false,
      "location": null,
      "deleted": false,
      "street1": null,
      "street2": null,
      "city": "Barcelona",
      "state": null,
      "phone_number": null,
      "postal_code": "10002",
      "country": "us",
      "financing": "credit",
      "bank": "JPMORGAN CHASE BANK N.A.",
      "brand": "Visa",
      "fingerprint": "ZmYHTfxzcB4xH5GTzXaPWRRpScr5nGNEDaPJ2XYJQfw=",
      "first_digits": null,
      "last_digits": "4242",
      "name": "Valerio Vincenzo",
      "expiration_month": 6,
      "expiration_year": 2029,
      "security_code_check": true,
      "tokenization_method": null,
      "created_at": "2024-09-17T06:51:44Z"
    },
    "created_at": "2024-09-17T06:51:44Z"
  };
  static final invalidCard = {
    "object": "error",
    "location": "https://www.omise.co/api-errors#invalid-card",
    "code": "invalid_card",
    "message": "number is invalid"
  };
  static final getToken = {
    "object": "token",
    "id": "tokn_test_6143sao9orm05j2t78j",
    "livemode": false,
    "location": "https://vault.omise.co/tokens/tokn_test_6143sao9orm05j2t78j",
    "used": false,
    "charge_status": "unknown",
    "card": {
      "object": "card",
      "id": "card_test_6143sao8wybyfayleob",
      "livemode": false,
      "location": null,
      "deleted": false,
      "street1": null,
      "street2": null,
      "city": "Barcelona",
      "state": null,
      "phone_number": null,
      "postal_code": "10002",
      "country": "us",
      "financing": "credit",
      "bank": "JPMORGAN CHASE BANK N.A.",
      "brand": "Visa",
      "fingerprint": "ZmYHTfxzcB4xH5GTzXaPWRRpScr5nGNEDaPJ2XYJQfw=",
      "first_digits": null,
      "last_digits": "4242",
      "name": "Valerio Vincenzo",
      "expiration_month": 6,
      "expiration_year": 2029,
      "security_code_check": true,
      "tokenization_method": null,
      "created_at": "2024-09-17T06:51:44Z"
    },
    "created_at": "2024-09-17T06:51:44Z"
  };
  static final tokenNotFound = {
    "object": "error",
    "location": "https://www.omise.co/api-errors#not-found",
    "code": "not_found",
    "message": "token tokn_test_6143sao9orm05j2t78jl was not found"
  };
}
