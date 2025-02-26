class CapabilityMock {
  static final getCapability = {
    'object': 'capability',
    'location': '/capability',
    'banks': ['bbl', 'kbank'],
    'limits': {
      'charge_amount': {'max': 100000, 'min': 1000},
      'transfer_amount': {'max': 50000, 'min': 500},
      'installment_amount': {'min': 5000},
    },
    'payment_methods': [
      {
        'object': 'payment_method',
        'name': 'card',
        'currencies': ['THB', 'USD'],
        'card_brands': ['Visa', 'MasterCard'],
        'installment_terms': [3, 6],
        'banks': [
          {"code": "affin", "name": "Affin Bank", "active": true}
        ],
        'provider': 'visa',
      }
    ],
    'tokenization_methods': ['googlepay', 'applepay'],
    'zero_interest_installments': true,
    'country': 'TH',
  };
  static final authFailed = {
    "object": "error",
    "location": "https://www.omise.co/api-errors#authentication-failure",
    "code": "authentication_failure",
    "message": "authentication failed"
  };
}
