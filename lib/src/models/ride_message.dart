import 'dart:convert';
import 'dart:ui';
import 'package:meta/meta.dart';

@immutable
class RideMessage {
  const RideMessage({
    required this.from,
    this.message = '',
    this.time,
  });

  factory RideMessage.fromJson(String source) =>
      RideMessage.fromMap(json.decode(source));

  factory RideMessage.fromMap(map) {
    return RideMessage(
      from: map['from'] as String? ?? '',
      message: map['message'] as String? ?? '',
      time: (DateTime.tryParse(map['time'] as String) ?? DateTime.now())
          .toLocal(),
    );
  }

  final String from;
  final String message;
  final DateTime? time;

  RideMessage copyWith({
    String? from,
    String? message,
    DateTime? time,
  }) {
    return RideMessage(
      from: from ?? this.from,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> get toMap => {
        'from': from,
        'message': message,
        'time': time?.toUtc().toString(),
      };

  String toJson() => json.encode(toMap);

  bool isMine(String id) => from == id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RideMessage &&
        other.from == from &&
        other.message == message &&
        other.time == time;
  }

  @override
  int get hashCode {
    return hashList([
      from,
      message,
      time,
    ]);
  }
}
