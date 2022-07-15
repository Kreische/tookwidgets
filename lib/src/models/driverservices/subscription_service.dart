import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:tookwidgets/src/models/amount.dart';
import 'package:tookwidgets/src/models/working_days.dart';

@immutable
class Subscription {
  const Subscription({
    required this.enabled,
    required this.availableQuantity,
    required this.price,
    required this.workingDays,
  });

  factory Subscription.fromMap(map) {
    return Subscription(
      enabled: (map['enabled'] ?? false) as bool,
      availableQuantity: (map['availableQuantity']?.toInt() ?? 0) as int,
      price: Amount.fromMap(map['price']),
      workingDays: WorkingDays.fromMap(map['workingDays']),
    );
  }

  factory Subscription.fromJson(String source) =>
      Subscription.fromMap(json.decode(source));

  final bool enabled;
  final int availableQuantity;
  final Amount price;
  final WorkingDays workingDays;

  Subscription copyWith({
    bool? enabled,
    int? availableQuantity,
    Amount? price,
    WorkingDays? workingDays,
  }) {
    return Subscription(
      enabled: enabled ?? this.enabled,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      price: price ?? this.price,
      workingDays: workingDays ?? this.workingDays,
    );
  }

  Map<String, dynamic> get toMap => {
        'enabled': enabled,
        'availableQuantity': availableQuantity,
        'price': price.toMap,
        'workingDays': workingDays.toMap,
      };

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Subscription &&
        other.enabled == enabled &&
        other.availableQuantity == availableQuantity &&
        other.price == price &&
        other.workingDays == workingDays;
  }

  @override
  int get hashCode {
    return hashList([
      enabled,
      availableQuantity,
      price,
      workingDays,
    ]);
  }
}
