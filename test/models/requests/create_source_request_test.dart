import 'package:test/test.dart';
import 'package:omise_dart/src/models/requests/create_source_request.dart';
import 'package:omise_dart/src/enums/currency.dart';
import 'package:omise_dart/src/enums/payment_method_name.dart';

void main() {
  group('CreateSourceRequest', () {
    test('toJson should convert CreateSourceRequest to correct map', () {
      final request = CreateSourceRequest(
        amount: 1000,
        currency: Currency.thb,
        type: PaymentMethodName.promptpay,
        bank: 'scb',
        email: 'test@example.com',
        phoneNumber: '+1234567890',
        name: 'John Doe',
        billing: BillingAddress(
          country: 'US',
          city: 'New York',
          postalCode: '10001',
          state: 'NY',
          street1: '123 Main St',
          street2: 'Apt 4B',
        ),
        shipping: ShippingAddress(
          country: 'US',
          city: 'New York',
          postalCode: '10001',
          state: 'NY',
          street1: '123 Main St',
          street2: 'Apt 4B',
        ),
        items: [
          Item(
            amount: 500,
            sku: '123456',
            name: 'Test Item',
            quantity: 1,
            category: 'Electronics',
            brand: 'BrandName',
            itemUri: 'http://example.com/item',
            imageUri: 'http://example.com/image',
          ),
        ],
      );

      final json = request.toJson();

      expect(json['amount'], 1000);
      expect(json['currency'], 'THB');
      expect(json['type'], 'promptpay');
      expect(json['bank'], 'scb');
      expect(json['email'], 'test@example.com');
      expect(json['phone_number'], '+1234567890');
      expect(json['name'], 'John Doe');
      expect(json['billing']['country'], 'US');
      expect(json['shipping']['country'], 'US');
      expect(json['items'][0]['amount'], 500);
    });

    test('fromJson should create CreateSourceRequest from map correctly', () {
      const json = {
        'amount': 1000,
        'currency': 'thb',
        'type': 'promptpay',
        'bank': 'scb',
        'email': 'test@example.com',
        'phone_number': '+1234567890',
        'name': 'John Doe',
        'billing': {
          'country': 'US',
          'city': 'New York',
          'postal_code': '10001',
          'state': 'NY',
          'street1': '123 Main St',
          'street2': 'Apt 4B',
        },
        'shipping': {
          'country': 'US',
          'city': 'New York',
          'postal_code': '10001',
          'state': 'NY',
          'street1': '123 Main St',
          'street2': 'Apt 4B',
        },
        'items': [
          {
            'amount': 500,
            'sku': '123456',
            'name': 'Test Item',
            'quantity': 1,
            'category': 'Electronics',
            'brand': 'BrandName',
            'item_uri': 'http://example.com/item',
            'image_uri': 'http://example.com/image',
          },
        ],
      };

      final request = CreateSourceRequest.fromJson(json);

      expect(request.amount, 1000);
      expect(request.currency, Currency.thb);
      expect(request.type, PaymentMethodName.promptpay);
      expect(request.bank, 'scb');
      expect(request.email, 'test@example.com');
      expect(request.phoneNumber, '+1234567890');
      expect(request.name, 'John Doe');
      expect(request.billing?.country, 'US');
      expect(request.shipping?.country, 'US');
      expect(request.items?[0].amount, 500);
    });

    test('toJson and fromJson should work together', () {
      final request = CreateSourceRequest(
        amount: 1000,
        currency: Currency.thb,
        type: PaymentMethodName.promptpay,
        bank: 'scb',
        email: 'test@example.com',
        phoneNumber: '+1234567890',
        name: 'John Doe',
        billing: BillingAddress(
          country: 'US',
          city: 'New York',
          postalCode: '10001',
          state: 'NY',
          street1: '123 Main St',
          street2: 'Apt 4B',
        ),
        shipping: ShippingAddress(
          country: 'US',
          city: 'New York',
          postalCode: '10001',
          state: 'NY',
          street1: '123 Main St',
          street2: 'Apt 4B',
        ),
        items: [
          Item(
            amount: 500,
            sku: '123456',
            name: 'Test Item',
            quantity: 1,
            category: 'Electronics',
            brand: 'BrandName',
            itemUri: 'http://example.com/item',
            imageUri: 'http://example.com/image',
          ),
        ],
      );

      final json = request.toJson();
      final newRequest = CreateSourceRequest.fromJson(json);

      expect(newRequest.amount, request.amount);
      expect(newRequest.currency, request.currency);
      expect(newRequest.type, request.type);
      expect(newRequest.bank, request.bank);
      expect(newRequest.email, request.email);
      expect(newRequest.phoneNumber, request.phoneNumber);
      expect(newRequest.name, request.name);
      expect(newRequest.billing?.country, request.billing?.country);
      expect(newRequest.shipping?.country, request.shipping?.country);
      expect(newRequest.items?[0].amount, request.items?[0].amount);
    });
  });
}
