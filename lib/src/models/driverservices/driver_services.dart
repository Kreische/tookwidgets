import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:tookwidgets/src/models/driverservices/subscription_service.dart';
import 'package:tookwidgets/took_widgets.dart';

part 'rideshare_extras.dart';
part 'rideshare_service_prices.dart';
part 'rideshare_service.dart';
part 'rideshare_services_opts.dart';
part 'wifi_config.dart';

@immutable
class DriverServices {
  const DriverServices({
    this.rideshare = const RideshareService(),
    this.taxiMeter = const TaxiMeter(),
    this.subscription,
  });

  factory DriverServices.fromMap(map) {
    if (map == null) return const DriverServices();
    return DriverServices(
      rideshare: RideshareService.fromMap(map['rideshare']),
      taxiMeter: TaxiMeter.fromMap(map['taxiMeter']),
      subscription: map['subscription'] == null
          ? null
          : Subscription.fromMap(map['subscription']),
    );
  }

  factory DriverServices.fromJson(String source) =>
      DriverServices.fromMap(json.decode(source));

  final RideshareService rideshare;
  final TaxiMeter taxiMeter;
  final Subscription? subscription;

  DriverServices copyWith({
    RideshareService? rideshare,
    TaxiMeter? taxiMeter,
    Subscription? subscription,
  }) {
    return DriverServices(
      rideshare: rideshare ?? this.rideshare,
      taxiMeter: taxiMeter ?? this.taxiMeter,
      subscription: subscription ?? this.subscription,
    );
  }

  Map<String, dynamic> get toMap => {
        'rideshare': rideshare.toMap,
        'taxiMeter': taxiMeter.toMap,
        'subscription': subscription?.toMap,
      };

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DriverServices &&
        other.rideshare == rideshare &&
        other.taxiMeter == taxiMeter;
  }

  @override
  int get hashCode {
    return hashList([
      rideshare,
      taxiMeter,
    ]);
  }
}
