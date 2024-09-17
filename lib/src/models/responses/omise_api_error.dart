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
        object: data['object'],
        location: data['location'],
        code: data['code'],
        message: data['message'],
      );

  Map<String, dynamic> toJson() => {
        'object': object,
        'location': location,
        'code': code,
        'message': message,
      };
}
