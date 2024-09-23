class BaseResponse {
  final String object;
  final String id;
  final bool livemode;
  final String? location;

  BaseResponse({
    required this.object,
    required this.id,
    required this.livemode,
    this.location,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      object: json['object'],
      id: json['id'],
      livemode: json['livemode'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'id': id,
      'livemode': livemode,
      'location': location,
    };
  }
}
