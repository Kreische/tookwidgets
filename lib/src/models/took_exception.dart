import 'dart:convert';

class TookException {
  TookException(
    this.message, {
    this.extra,
  });

  factory TookException.fromMap(map) {
    return TookException(
      (map['message'] ?? '') as String,
      extra: map['extra'],
    );
  }

  factory TookException.fromJson(String source) =>
      TookException.fromMap(json.decode(source));
  final String message;
  final dynamic extra;

  TookException copyWith({
    String? message,
    extra,
  }) {
    return TookException(
      message ?? this.message,
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
