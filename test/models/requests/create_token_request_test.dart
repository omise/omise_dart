import 'package:test/test.dart';
import 'package:omise_dart/src/models/requests/create_token_request.dart';

void main() {
  group('CreateTokenRequest', () {
    test('toJson should convert CreateTokenRequest to correct map', () {
      final request = CreateTokenRequest(
        name: 'John Doe',
        number: '4242424242424242',
        expirationMonth: '12',
        expirationYear: '2030',
        securityCode: '123',
        city: 'New York',
        country: 'US',
        postalCode: '10001',
        phoneNumber: '+11234567890',
        email: 'john.doe@example.com',
        state: 'NY',
        street1: '123 Main St',
        street2: 'Apt 4B',
      );

      final json = request.toJson();

      expect(json['name'], 'John Doe');
      expect(json['number'], '4242424242424242');
      expect(json['expiration_month'], '12');
      expect(json['expiration_year'], '2030');
      expect(json['security_code'], '123');
      expect(json['city'], 'New York');
      expect(json['country'], 'US');
      expect(json['postal_code'], '10001');
      expect(json['phone_number'], '+11234567890');
      expect(json['email'], 'john.doe@example.com');
      expect(json['state'], 'NY');
      expect(json['street1'], '123 Main St');
      expect(json['street2'], 'Apt 4B');
    });

    test('fromJson should create CreateTokenRequest from map correctly', () {
      const json = {
        'name': 'John Doe',
        'number': '4242424242424242',
        'expiration_month': '12',
        'expiration_year': '2030',
        'security_code': '123',
        'city': 'New York',
        'country': 'US',
        'postal_code': '10001',
        'phone_number': '+11234567890',
        'email': 'john.doe@example.com',
        'state': 'NY',
        'street1': '123 Main St',
        'street2': 'Apt 4B',
      };

      final request = CreateTokenRequest.fromJson(json);

      expect(request.name, 'John Doe');
      expect(request.number, '4242424242424242');
      expect(request.expirationMonth, '12');
      expect(request.expirationYear, '2030');
      expect(request.securityCode, '123');
      expect(request.city, 'New York');
      expect(request.country, 'US');
      expect(request.postalCode, '10001');
      expect(request.phoneNumber, '+11234567890');
      expect(request.email, 'john.doe@example.com');
      expect(request.state, 'NY');
      expect(request.street1, '123 Main St');
      expect(request.street2, 'Apt 4B');
    });

    test('toJson and fromJson should work together', () {
      final request = CreateTokenRequest(
        name: 'John Doe',
        number: '4242424242424242',
        expirationMonth: '12',
        expirationYear: '2030',
        securityCode: '123',
        city: 'New York',
        country: 'US',
        postalCode: '10001',
        phoneNumber: '+11234567890',
        email: 'john.doe@example.com',
        state: 'NY',
        street1: '123 Main St',
        street2: 'Apt 4B',
      );

      final json = request.toJson();
      final newRequest = CreateTokenRequest.fromJson(json);

      expect(newRequest.name, request.name);
      expect(newRequest.number, request.number);
      expect(newRequest.expirationMonth, request.expirationMonth);
      expect(newRequest.expirationYear, request.expirationYear);
      expect(newRequest.securityCode, request.securityCode);
      expect(newRequest.city, request.city);
      expect(newRequest.country, request.country);
      expect(newRequest.postalCode, request.postalCode);
      expect(newRequest.phoneNumber, request.phoneNumber);
      expect(newRequest.email, request.email);
      expect(newRequest.state, request.state);
      expect(newRequest.street1, request.street1);
      expect(newRequest.street2, request.street2);
    });
  });
}
