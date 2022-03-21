import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class RideshareServicePrices {
  const RideshareServicePrices({
    this.distanceToSendOffer = 15000,
    this.surgeValue = 1,
    this.basePrice = 0,
    this.pricePerKM = 0,
    this.pricePerMin = 0,
    this.minimumPrice = 0,
  });

  factory RideshareServicePrices.fromMap(map) {
    if (map == null) return const RideshareServicePrices();
    return RideshareServicePrices(
      distanceToSendOffer: (map['distanceToSendOffer'] ?? 0) as num,
      surgeValue: (map['surgeValue'] ?? 0) as num,
      basePrice: (map['basePrice'] ?? 0) as num,
      pricePerKM: (map['pricePerKM'] ?? 0) as num,
      pricePerMin: (map['pricePerMin'] ?? 0) as num,
      minimumPrice: (map['minimumPrice'] ?? 0) as num,
    );
  }

  factory RideshareServicePrices.fromJson(String source) =>
      RideshareServicePrices.fromMap(json.decode(source));

  final num distanceToSendOffer;
  final num surgeValue;
  final num basePrice;
  final num pricePerKM;
  final num pricePerMin;
  final num minimumPrice;

  RideshareServicePrices copyWith({
    num? distanceToSendOffer,
    num? surgeValue,
    num? basePrice,
    num? pricePerKM,
    num? pricePerMin,
    num? minimumPrice,
  }) {
    return RideshareServicePrices(
      distanceToSendOffer: distanceToSendOffer ?? this.distanceToSendOffer,
      surgeValue: surgeValue ?? this.surgeValue,
      basePrice: basePrice ?? this.basePrice,
      pricePerKM: pricePerKM ?? this.pricePerKM,
      pricePerMin: pricePerMin ?? this.pricePerMin,
      minimumPrice: minimumPrice ?? this.minimumPrice,
    );
  }

  Map<String, dynamic> get toMap => {
        'distanceToSendOffer': distanceToSendOffer,
        'surgeValue': surgeValue,
        'basePrice': basePrice,
        'pricePerKM': pricePerKM,
        'pricePerMin': pricePerMin,
        'minimumPrice': minimumPrice,
      };

  num get basePriceToDisplay => basePrice * surgeValue;

  num get pricePerKMToDisplay => pricePerKM * surgeValue;

  num get pricePerMinToDisplay => pricePerMin * surgeValue;

  num get minimumPriceToDisplay => minimumPrice * surgeValue;

  bool get haveNoAmountSet =>
      minimumPrice == 0 &&
      pricePerKM == 0 &&
      pricePerMin == 0 &&
      basePrice == 0;

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RideshareServicePrices &&
        other.distanceToSendOffer == distanceToSendOffer &&
        other.surgeValue == surgeValue &&
        other.basePrice == basePrice &&
        other.pricePerKM == pricePerKM &&
        other.pricePerMin == pricePerMin &&
        other.minimumPrice == minimumPrice;
  }

  @override
  int get hashCode {
    return hashList([
      distanceToSendOffer,
      surgeValue,
      basePrice,
      pricePerKM,
      pricePerMin,
      minimumPrice,
    ]);
  }
}
