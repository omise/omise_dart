class OmiseApiError {
  final String object;
  final String location;
  final String code;
  final String message;

  const OmiseApiError({
    required this.object,
    required this.location,
    required this.code,
    required this.message,
  });

  factory OmiseApiError.fromJson(Map<String, dynamic> data) => OmiseApiError(
        object: data['object'] as String,
        location: data['location'] as String,
        code: data['code'] as String,
        message: data['message'] as String,
      );

  Map<String, dynamic> toJson() => {
        'object': object,
        'location': location,
        'code': code,
        'message': message,
      };
}
