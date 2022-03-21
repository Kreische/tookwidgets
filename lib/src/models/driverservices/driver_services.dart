import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
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
  });

  factory DriverServices.fromMap(map) {
    if (map == null) return const DriverServices();
    return DriverServices(
      rideshare: RideshareService.fromMap(map['rideshare']),
    );
  }

  factory DriverServices.fromJson(String source) =>
      DriverServices.fromMap(json.decode(source));

  final RideshareService rideshare;

  DriverServices copyWith({
    RideshareService? rideshare,
  }) {
    return DriverServices(
      rideshare: rideshare ?? this.rideshare,
    );
  }

  Map<String, dynamic> get toMap => {
        'rideshare': rideshare.toMap,
      };

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DriverServices && other.rideshare == rideshare;
  }

  @override
  int get hashCode {
    return hashList([
      rideshare,
    ]);
  }
}
