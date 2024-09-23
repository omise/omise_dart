import 'package:omise_dart/src/models/responses/base_response.dart';
import 'package:test/test.dart';

void main() {
  group('BaseResponse', () {
    test('fromJson should create an instance from a valid JSON', () {
      final json = {
        'object': 'test_object',
        'id': 'test_id',
        'livemode': true,
        'location': 'test_location',
      };

      final response = BaseResponse.fromJson(json);

      expect(response, isA<BaseResponse>());
      expect(response.object, 'test_object');
      expect(response.id, 'test_id');
      expect(response.livemode, true);
      expect(response.location, 'test_location');
    });

    test('fromJson should handle null location', () {
      final json = {
        'object': 'test_object',
        'id': 'test_id',
        'livemode': true,
        'location': null,
      };

      final response = BaseResponse.fromJson(json);

      expect(response, isA<BaseResponse>());
      expect(response.object, 'test_object');
      expect(response.id, 'test_id');
      expect(response.livemode, true);
      expect(response.location, isNull);
    });

    test('toJson should return a valid JSON map', () {
      final baseResponse = BaseResponse(
        object: 'test_object',
        id: 'test_id',
        livemode: false,
        location: 'test_location',
      );

      final json = baseResponse.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['object'], 'test_object');
      expect(json['id'], 'test_id');
      expect(json['livemode'], false);
      expect(json['location'], 'test_location');
    });

    test('toJson should handle null location', () {
      final baseResponse = BaseResponse(
        object: 'test_object',
        id: 'test_id',
        livemode: false,
        location: null,
      );

      final json = baseResponse.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['object'], 'test_object');
      expect(json['id'], 'test_id');
      expect(json['livemode'], false);
      expect(json['location'], isNull);
    });
  });
}
