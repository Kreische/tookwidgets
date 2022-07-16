import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'package:tookwidgets/src/models/amount.dart';
import 'package:tookwidgets/src/models/working_days.dart';

@immutable
class Subscription {
  const Subscription({
    this.enabled = false,
    this.availableQuantity = 0,
    this.price = const Amount(),
    this.availability = const SubscriptionAvailability(),
  });

  factory Subscription.fromMap(map) {
    if (map == null) return const Subscription();
    return Subscription(
      enabled: (map['enabled'] ?? false) as bool,
      availableQuantity: (map['availableQuantity']?.toInt() ?? 0) as int,
      price: Amount.fromMap(map['price']),
      availability: SubscriptionAvailability.fromMap(map['availability']),
    );
  }

  factory Subscription.fromJson(String source) =>
      Subscription.fromMap(json.decode(source));

  final bool enabled;
  final int availableQuantity;
  final Amount price;
  final SubscriptionAvailability availability;

  Subscription copyWith({
    bool? enabled,
    int? availableQuantity,
    Amount? price,
    SubscriptionAvailability? availability,
  }) {
    return Subscription(
      enabled: enabled ?? this.enabled,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      price: price ?? this.price,
      availability: availability ?? this.availability,
    );
  }

  Map<String, dynamic> get toMap => {
        'enabled': enabled,
        'availableQuantity': availableQuantity,
        'price': price.toMap,
        'availability': availability.toMap,
      };

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Subscription &&
        other.enabled == enabled &&
        other.availableQuantity == availableQuantity &&
        other.price == price &&
        other.availability == availability;
  }

  @override
  int get hashCode {
    return hashList([
      enabled,
      availableQuantity,
      price,
      availability,
    ]);
  }
}

@immutable
class SubscriptionAvailability {
  const SubscriptionAvailability({
    this.workingDays = const WorkingDays(),
    this.startTime,
    this.endTime,
  });

  factory SubscriptionAvailability.fromMap(map) {
    if (map == null) return const SubscriptionAvailability();
    return SubscriptionAvailability(
      workingDays: WorkingDays.fromMap(map['workingDays']),
      startTime: map['startTime'] == null
          ? null
          : DateTime.parse(map['startTime'] as String),
      endTime: map['endTime'] == null
          ? null
          : DateTime.parse(map['endTime'] as String),
    );
  }

  factory SubscriptionAvailability.fromJson(String source) =>
      SubscriptionAvailability.fromMap(json.decode(source));

  final WorkingDays workingDays;
  final DateTime? startTime;
  final DateTime? endTime;

  SubscriptionAvailability copyWith({
    WorkingDays? workingDays,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return SubscriptionAvailability(
      workingDays: workingDays ?? this.workingDays,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'workingDays': workingDays.toMap,
      'startTime': startTime?.toUtc(),
      'endTime': endTime?.toUtc(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubscriptionAvailability &&
        other.workingDays == workingDays &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return hashList([
      workingDays,
      startTime,
      endTime,
    ]);
  }
}
