import 'package:omise_dart/src/extensions/date_time_no_milliseconds.dart';
import 'package:test/test.dart';
import 'package:omise_dart/omise_dart.dart';

void main() {
  group('CreateChargeRequest', () {
    test('toJson should convert CreateChargeRequest to correct map', () {
      final request = CreateChargeRequest(
        amount: 5000,
        currency: Currency.thb,
        authorizationType: AuthorizationType.preAuth,
        capture: true,
        card: 'card_123',
        customer: 'cust_456',
        description: 'Test charge',
        expiresAt: DateTime.utc(2025, 4, 1, 12),
        firstCharge: 'charge_001',
        ip: '127.0.0.1',
        linkedAccount: 'link_789',
        metadata: {'order_id': 'A123'},
        platformFee: PlatformFeeRequest(fixed: 100, percentage: 2.5),
        recurringReason: 'monthly subscription',
        returnUri: 'https://example.com/return',
        source: 'source_987',
        transactionIndicator: 'ecommerce',
        webhookEndpoints: ['https://webhook.site/test'],
        zeroInterestInstallments: false,
      );

      final json = request.toJson();

      expect(json['amount'], 5000);
      expect(json['currency'], 'THB');
      expect(json['authorization_type'], 'pre_auth');
      expect(json['capture'], true);
      expect(json['card'], 'card_123');
      expect(json['customer'], 'cust_456');
      expect(json['description'], 'Test charge');
      expect(json['expires_at'], '2025-04-01T12:00:00Z');
      expect(json['first_charge'], 'charge_001');
      expect(json['ip'], '127.0.0.1');
      expect(json['linked_account'], 'link_789');
      expect(json['metadata']['order_id'], 'A123');
      expect(json['platform_fee']['fixed'], 100);
      expect(json['platform_fee']['percentage'], 2.5);
      expect(json['recurring_reason'], 'monthly subscription');
      expect(json['return_uri'], 'https://example.com/return');
      expect(json['source'], 'source_987');
      expect(json['transaction_indicator'], 'ecommerce');
      expect(json['webhook_endpoints'][0], 'https://webhook.site/test');
      expect(json['zero_interest_installments'], false);
    });

    test('fromJson should create CreateChargeRequest from map correctly', () {
      const json = {
        'amount': 5000,
        'currency': 'thb',
        'authorization_type': 'pre_auth',
        'capture': true,
        'card': 'card_123',
        'customer': 'cust_456',
        'description': 'Test charge',
        'expires_at': '2025-04-17T12:46:51Z',
        'first_charge': 'charge_001',
        'ip': '127.0.0.1',
        'linked_account': 'link_789',
        'metadata': {'order_id': 'A123'},
        'platform_fee': {
          'fixed': 100,
          'percentage': 2.5,
        },
        'recurring_reason': 'monthly subscription',
        'return_uri': 'https://example.com/return',
        'source': 'source_987',
        'transaction_indicator': 'ecommerce',
        'webhook_endpoints': ['https://webhook.site/test'],
        'zero_interest_installments': false,
      };

      final request = CreateChargeRequest.fromJson(json);

      expect(request.amount, 5000);
      expect(request.currency, Currency.thb);
      expect(request.authorizationType, AuthorizationType.preAuth);
      expect(request.capture, true);
      expect(request.card, 'card_123');
      expect(request.customer, 'cust_456');
      expect(request.description, 'Test charge');
      expect(request.expiresAt?.toIso8601StringWithoutMilliseconds(),
          '2025-04-17T12:46:51Z');
      expect(request.firstCharge, 'charge_001');
      expect(request.ip, '127.0.0.1');
      expect(request.linkedAccount, 'link_789');
      expect(request.metadata?['order_id'], 'A123');
      expect(request.platformFee?.fixed, 100);
      expect(request.platformFee?.percentage, 2.5);
      expect(request.recurringReason, 'monthly subscription');
      expect(request.returnUri, 'https://example.com/return');
      expect(request.source, 'source_987');
      expect(request.transactionIndicator, 'ecommerce');
      expect(request.webhookEndpoints?[0], 'https://webhook.site/test');
      expect(request.zeroInterestInstallments, false);
    });

    test('toJson and fromJson should work together', () {
      final original = CreateChargeRequest(
        amount: 5000,
        currency: Currency.thb,
        authorizationType: AuthorizationType.preAuth,
        capture: true,
        card: 'card_123',
        customer: 'cust_456',
        description: 'Test charge',
        expiresAt: DateTime.utc(2025, 4, 1, 12),
        firstCharge: 'charge_001',
        ip: '127.0.0.1',
        linkedAccount: 'link_789',
        metadata: {'order_id': 'A123'},
        platformFee: PlatformFeeRequest(fixed: 100, percentage: 2.5),
        recurringReason: 'monthly subscription',
        returnUri: 'https://example.com/return',
        source: 'source_987',
        transactionIndicator: 'ecommerce',
        webhookEndpoints: ['https://webhook.site/test'],
        zeroInterestInstallments: false,
      );

      final json = original.toJson();
      final newRequest = CreateChargeRequest.fromJson(json);

      expect(newRequest.amount, original.amount);
      expect(newRequest.currency, original.currency);
      expect(newRequest.authorizationType, original.authorizationType);
      expect(newRequest.capture, original.capture);
      expect(newRequest.card, original.card);
      expect(newRequest.customer, original.customer);
      expect(newRequest.description, original.description);
      expect(newRequest.expiresAt?.toIso8601StringWithoutMilliseconds(),
          original.expiresAt?.toIso8601StringWithoutMilliseconds());
      expect(newRequest.firstCharge, original.firstCharge);
      expect(newRequest.ip, original.ip);
      expect(newRequest.linkedAccount, original.linkedAccount);
      expect(newRequest.metadata?['order_id'], original.metadata?['order_id']);
      expect(newRequest.platformFee?.fixed, original.platformFee?.fixed);
      expect(
          newRequest.platformFee?.percentage, original.platformFee?.percentage);
      expect(newRequest.recurringReason, original.recurringReason);
      expect(newRequest.returnUri, original.returnUri);
      expect(newRequest.source, original.source);
      expect(newRequest.transactionIndicator, original.transactionIndicator);
      expect(newRequest.webhookEndpoints, original.webhookEndpoints);
      expect(newRequest.zeroInterestInstallments,
          original.zeroInterestInstallments);
    });
  });
}
