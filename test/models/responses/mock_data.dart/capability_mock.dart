class CapabilityMock {
  static final getCapability = {
    'object': 'capability',
    'location': '/capability',
    'banks': ['bank1', 'bank2'],
    'limits': {
      'charge_amount': {'max': 100000, 'min': 1000},
      'transfer_amount': {'max': 50000, 'min': 500},
      'installment_amount': {'min': 5000},
    },
    'payment_methods': [
      {
        'object': 'payment_method',
        'name': 'credit_card',
        'currencies': ['THB', 'USD'],
        'card_brands': ['visa', 'mastercard'],
        'installment_terms': [3, 6],
        'banks': ['bank1'],
        'provider': 'visa',
      }
    ],
    'tokenization_methods': ['method1', 'method2'],
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
