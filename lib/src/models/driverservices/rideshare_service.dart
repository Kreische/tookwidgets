import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:tookwidgets/src/models/driverservices/rideshare_service_prices.dart';
import 'package:tookwidgets/src/models/driverservices/rideshare_services_opts.dart';

@immutable
class RideshareService {
  const RideshareService({
    this.prices = const RideshareServicePrices(),
    this.options = const RideshareServiceOpts(),
  });

  factory RideshareService.fromMap(map) {
    if (map == null) return const RideshareService();
    return RideshareService(
      prices: RideshareServicePrices.fromMap(map['prices']),
      options: RideshareServiceOpts.fromMap(map['options']),
    );
  }

  factory RideshareService.fromJson(String source) =>
      RideshareService.fromMap(json.decode(source));

  final RideshareServicePrices prices;
  final RideshareServiceOpts options;

  RideshareService copyWith({
    RideshareServicePrices? prices,
    RideshareServiceOpts? options,
  }) {
    return RideshareService(
      prices: prices ?? this.prices,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> get toMap => {
        'prices': prices.toMap,
        'options': options.toMap,
      };

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RideshareService &&
        other.prices == prices &&
        other.options == options;
  }

  @override
  int get hashCode {
    return hashList([
      prices,
      options,
    ]);
  }
}
