import 'package:omise_dart/omise_dart.dart';
import 'package:omise_dart/src/enums/absorption_type.dart';
import 'package:omise_dart/src/enums/charge_status.dart';
import 'package:omise_dart/src/enums/payment_method_name.dart';
import 'package:omise_dart/src/extensions/date_time_no_milliseconds.dart';
import 'package:omise_dart/src/models/responses/source.dart';
import 'package:test/test.dart';

void main() {
  group('Source model tests', () {
    final createdAt = DateTime.parse('2024-11-08T07:50:24Z');
    final expiresAt = DateTime.parse('2024-12-08T07:50:24Z');
    test('Source serialization and deserialization', () {
      final source = Source(
        object: 'source',
        id: 'src_123',
        livemode: true,
        amount: 1000,
        chargeStatus: ChargeStatus.pending,
        createdAt: createdAt,
        currency: 'THB',
        flow: 'redirect',
        type: PaymentMethodName.promptpay,
        absorptionType: AbsorptionType.customer,
        bank: Bank.scb,
      );

      final json = source.toJson();
      expect(json['object'], 'source');
      expect(json['id'], 'src_123');
      expect(json['livemode'], true);
      expect(json['amount'], 1000);
      expect(json['charge_status'], 'pending');
      expect(
          json['created_at'], createdAt.toIso8601StringWithoutMilliseconds());
      expect(json['currency'], 'THB');
      expect(json['flow'], 'redirect');
      expect(json['absorption_type'], 'customer');
      expect(json['bank'], 'scb');

      final sourceFromJson = Source.fromJson(json);
      expect(sourceFromJson.object, 'source');
      expect(sourceFromJson.id, 'src_123');
      expect(sourceFromJson.livemode, true);
      expect(sourceFromJson.amount, 1000);
      expect(sourceFromJson.chargeStatus, ChargeStatus.pending);
      expect(sourceFromJson.createdAt, createdAt);
      expect(sourceFromJson.currency, 'THB');
      expect(sourceFromJson.flow, 'redirect');
      expect(sourceFromJson.type, PaymentMethodName.promptpay);
      expect(sourceFromJson.absorptionType, AbsorptionType.customer);
      expect(sourceFromJson.bank, Bank.scb);
    });

    test('ProviderReferences serialization and deserialization', () {
      final providerReferences = ProviderReferences(
        referenceNumber1: 'ref123',
        referenceNumber2: 'ref456',
        buyerName: 'John Doe',
      );

      final json = providerReferences.toJson();
      expect(json['reference_number_1'], 'ref123');
      expect(json['reference_number_2'], 'ref456');
      expect(json['buyer_name'], 'John Doe');

      final providerReferencesFromJson = ProviderReferences.fromJson(json);
      expect(providerReferencesFromJson.referenceNumber1, 'ref123');
      expect(providerReferencesFromJson.referenceNumber2, 'ref456');
      expect(providerReferencesFromJson.buyerName, 'John Doe');
    });

    test('References serialization and deserialization', () {
      final references = References(
        expiresAt: expiresAt,
        deviceId: 'device_123',
        customerAmount: 2000,
        customerCurrency: 'THB',
        customerExchangeRate: 1.0,
        omiseTaxId: 'tax_123',
        referenceNumber1: 'ref123',
        referenceNumber2: 'ref456',
        barcode: 'barcode_123',
        paymentCode: 'pay_123',
        vaCode: 'va_123',
      );

      final json = references.toJson();
      expect(
          json['expires_at'], expiresAt.toIso8601StringWithoutMilliseconds());
      expect(json['device_id'], 'device_123');
      expect(json['customer_amount'], 2000);
      expect(json['customer_currency'], 'THB');
      expect(json['customer_exchange_rate'], 1.0);
      expect(json['omise_tax_id'], 'tax_123');
      expect(json['reference_number_1'], 'ref123');
      expect(json['reference_number_2'], 'ref456');
      expect(json['barcode'], 'barcode_123');
      expect(json['payment_code'], 'pay_123');
      expect(json['va_code'], 'va_123');

      final referencesFromJson = References.fromJson(json);
      expect(referencesFromJson.expiresAt, expiresAt);
      expect(referencesFromJson.deviceId, 'device_123');
      expect(referencesFromJson.customerAmount, 2000);
      expect(referencesFromJson.customerCurrency, 'THB');
      expect(referencesFromJson.customerExchangeRate, 1.0);
      expect(referencesFromJson.omiseTaxId, 'tax_123');
      expect(referencesFromJson.referenceNumber1, 'ref123');
      expect(referencesFromJson.referenceNumber2, 'ref456');
      expect(referencesFromJson.barcode, 'barcode_123');
      expect(referencesFromJson.paymentCode, 'pay_123');
      expect(referencesFromJson.vaCode, 'va_123');
    });

    test('Document serialization and deserialization', () {
      final document = Document(
        object: 'document',
        id: 'doc_123',
        livemode: true,
        deleted: false,
        filename: 'file.pdf',
        kind: 'pdf',
        downloadUri: 'https://example.com/file.pdf',
        createdAt: createdAt,
      );

      final json = document.toJson();
      expect(json['object'], 'document');
      expect(json['id'], 'doc_123');
      expect(json['livemode'], true);
      expect(json['deleted'], false);
      expect(json['filename'], 'file.pdf');
      expect(json['kind'], 'pdf');
      expect(json['download_uri'], 'https://example.com/file.pdf');
      expect(
          json['created_at'], createdAt.toIso8601StringWithoutMilliseconds());

      final documentFromJson = Document.fromJson(json);
      expect(documentFromJson.object, 'document');
      expect(documentFromJson.id, 'doc_123');
      expect(documentFromJson.livemode, true);
      expect(documentFromJson.deleted, false);
      expect(documentFromJson.filename, 'file.pdf');
      expect(documentFromJson.kind, 'pdf');
      expect(documentFromJson.downloadUri, 'https://example.com/file.pdf');
      expect(documentFromJson.createdAt, createdAt);
    });

    test('Barcode serialization and deserialization', () {
      final document = Document(
        object: 'document',
        id: 'doc_123',
        livemode: true,
        deleted: false,
        filename: 'file.pdf',
        kind: 'pdf',
        downloadUri: 'https://example.com/file.pdf',
        createdAt: createdAt,
      );

      final barcode = Barcode(
        object: 'barcode',
        type: 'pdf417',
        image: document,
      );

      final json = barcode.toJson();
      expect(json['object'], 'barcode');
      expect(json['type'], 'pdf417');
      expect(json['image']['id'], 'doc_123');

      final barcodeFromJson = Barcode.fromJson(json);
      expect(barcodeFromJson.object, 'barcode');
      expect(barcodeFromJson.type, 'pdf417');
      expect(barcodeFromJson.image?.id, 'doc_123');
    });
  });
}
