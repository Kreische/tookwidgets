import 'dart:convert';

class TookError {
  TookError({
    required this.message,
    this.extra,
  });

  factory TookError.fromMap(map) {
    return TookError(
      message: (map['message'] ?? '') as String,
      extra: map['extra'],
    );
  }

  factory TookError.fromJson(String source) =>
      TookError.fromMap(json.decode(source));
  final String message;
  final dynamic extra;

  TookError copyWith({
    String? message,
    extra,
  }) {
    return TookError(
      message: message ?? this.message,
      extra: extra ?? this.extra,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'extra': extra,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => message;
}
