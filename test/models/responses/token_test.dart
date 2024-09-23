import 'package:omise_dart/src/models/responses/token.dart';
import 'package:test/test.dart';

void main() {
  group('Token', () {
    test('toJson should convert Token to correct map', () {
      final card = Card(
        object: 'card',
        id: 'card_123',
        livemode: true,
        deleted: false,
        brand: 'Visa',
        fingerprint: 'abcd1234',
        lastDigits: '4242',
        name: 'John Doe',
        expirationMonth: 12,
        expirationYear: 2030,
        securityCodeCheck: true,
        createdAt: '2024-09-15T00:00:00Z',
      );

      final token = Token(
        object: 'token',
        id: 'tok_123',
        livemode: true,
        used: false,
        chargeStatus: 'pending',
        card: card,
        createdAt: '2024-09-15T00:00:00Z',
      );

      final json = token.toJson();

      expect(json['object'], 'token');
      expect(json['id'], 'tok_123');
      expect(json['livemode'], true);
      expect(json['used'], false);
      expect(json['charge_status'], 'pending');
      expect(json['card']['id'], 'card_123');
      expect(json['created_at'], '2024-09-15T00:00:00Z');
    });

    test('fromJson should create Token from map correctly', () {
      final json = {
        'object': 'token',
        'id': 'tok_123',
        'livemode': true,
        'used': false,
        'charge_status': 'pending',
        'card': {
          'object': 'card',
          'id': 'card_123',
          'livemode': true,
          'deleted': false,
          'brand': 'Visa',
          'fingerprint': 'abcd1234',
          'last_digits': '4242',
          'name': 'John Doe',
          'expiration_month': 12,
          'expiration_year': 2030,
          'security_code_check': true,
          'created_at': '2024-09-15T00:00:00Z',
        },
        'created_at': '2024-09-15T00:00:00Z',
      };

      final token = Token.fromJson(json);

      expect(token.object, 'token');
      expect(token.id, 'tok_123');
      expect(token.livemode, true);
      expect(token.used, false);
      expect(token.chargeStatus, 'pending');
      expect(token.card.id, 'card_123');
      expect(token.createdAt, '2024-09-15T00:00:00Z');
    });

    test('toJson and fromJson should work together', () {
      final card = Card(
        object: 'card',
        id: 'card_123',
        livemode: true,
        deleted: false,
        brand: 'Visa',
        fingerprint: 'abcd1234',
        lastDigits: '4242',
        name: 'John Doe',
        expirationMonth: 12,
        expirationYear: 2030,
        securityCodeCheck: true,
        createdAt: '2024-09-15T00:00:00Z',
      );

      final token = Token(
        object: 'token',
        id: 'tok_123',
        livemode: true,
        used: false,
        chargeStatus: 'pending',
        card: card,
        createdAt: '2024-09-15T00:00:00Z',
      );

      final json = token.toJson();
      final newToken = Token.fromJson(json);

      expect(newToken.object, token.object);
      expect(newToken.id, token.id);
      expect(newToken.livemode, token.livemode);
      expect(newToken.used, token.used);
      expect(newToken.chargeStatus, token.chargeStatus);
      expect(newToken.card.id, token.card.id);
      expect(newToken.createdAt, token.createdAt);
    });
  });

  group('Card', () {
    test('toJson should convert Card to correct map', () {
      final card = Card(
        object: 'card',
        id: 'card_123',
        livemode: true,
        deleted: false,
        brand: 'Visa',
        fingerprint: 'abcd1234',
        lastDigits: '4242',
        name: 'John Doe',
        expirationMonth: 12,
        expirationYear: 2030,
        securityCodeCheck: true,
        createdAt: '2024-09-15T00:00:00Z',
      );

      final json = card.toJson();

      expect(json['object'], 'card');
      expect(json['id'], 'card_123');
      expect(json['livemode'], true);
      expect(json['deleted'], false);
      expect(json['brand'], 'Visa');
      expect(json['fingerprint'], 'abcd1234');
      expect(json['last_digits'], '4242');
      expect(json['name'], 'John Doe');
      expect(json['expiration_month'], 12);
      expect(json['expiration_year'], 2030);
      expect(json['security_code_check'], true);
      expect(json['created_at'], '2024-09-15T00:00:00Z');
    });

    test('fromJson should create Card from map correctly', () {
      final json = {
        'object': 'card',
        'id': 'card_123',
        'livemode': true,
        'deleted': false,
        'brand': 'Visa',
        'fingerprint': 'abcd1234',
        'last_digits': '4242',
        'name': 'John Doe',
        'expiration_month': 12,
        'expiration_year': 2030,
        'security_code_check': true,
        'created_at': '2024-09-15T00:00:00Z',
      };

      final card = Card.fromJson(json);

      expect(card.object, 'card');
      expect(card.id, 'card_123');
      expect(card.livemode, true);
      expect(card.deleted, false);
      expect(card.brand, 'Visa');
      expect(card.fingerprint, 'abcd1234');
      expect(card.lastDigits, '4242');
      expect(card.name, 'John Doe');
      expect(card.expirationMonth, 12);
      expect(card.expirationYear, 2030);
      expect(card.securityCodeCheck, true);
      expect(card.createdAt, '2024-09-15T00:00:00Z');
    });

    test('toJson and fromJson should work together', () {
      final card = Card(
        object: 'card',
        id: 'card_123',
        livemode: true,
        deleted: false,
        brand: 'Visa',
        fingerprint: 'abcd1234',
        lastDigits: '4242',
        name: 'John Doe',
        expirationMonth: 12,
        expirationYear: 2030,
        securityCodeCheck: true,
        createdAt: '2024-09-15T00:00:00Z',
      );

      final json = card.toJson();
      final newCard = Card.fromJson(json);

      expect(newCard.object, card.object);
      expect(newCard.id, card.id);
      expect(newCard.livemode, card.livemode);
      expect(newCard.deleted, card.deleted);
      expect(newCard.brand, card.brand);
      expect(newCard.fingerprint, card.fingerprint);
      expect(newCard.lastDigits, card.lastDigits);
      expect(newCard.name, card.name);
      expect(newCard.expirationMonth, card.expirationMonth);
      expect(newCard.expirationYear, card.expirationYear);
      expect(newCard.securityCodeCheck, card.securityCodeCheck);
      expect(newCard.createdAt, card.createdAt);
    });
  });
}
