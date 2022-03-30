import 'dart:convert';

enum TaximeterStatus { ForHire, Hired, Stopped }

enum TaximeterTariff { tariff1, tariff2, tariff3 }

extension TaximeterTariffExt on TaximeterTariff {
  String get name {
    switch (this) {
      case TaximeterTariff.tariff1:
        return 'Tariff 1';
      case TaximeterTariff.tariff2:
        return 'Tariff 2';
      case TaximeterTariff.tariff3:
        return 'Tariff 3';
      default:
        return 'Tariff';
    }
  }
}

extension TaximeterStatusExt on TaximeterStatus {
  String get name {
    switch (this) {
      case TaximeterStatus.ForHire:
        return 'FOR HIRE';
      case TaximeterStatus.Hired:
        return 'HIRED';
      case TaximeterStatus.Stopped:
        return 'STOPPED';
      default:
        return '';
    }
  }
}

class TaximeterTariffModel {
  const TaximeterTariffModel({
    this.tariff1 = const TaximeterTariffPrices(),
    this.tariff2 = const TaximeterTariffPrices(),
    this.tariff3 = const TaximeterTariffPrices(),
  });

  factory TaximeterTariffModel.fromMap(map) {
    return TaximeterTariffModel(
      tariff1: TaximeterTariffPrices.fromMap(map['tariff1']),
      tariff2: TaximeterTariffPrices.fromMap(map['tariff2']),
      tariff3: TaximeterTariffPrices.fromMap(map['tariff3']),
    );
  }

  factory TaximeterTariffModel.fromJson(String source) =>
      TaximeterTariffModel.fromMap(json.decode(source));

  final TaximeterTariffPrices tariff1;
  final TaximeterTariffPrices tariff2;
  final TaximeterTariffPrices tariff3;

  TaximeterTariffModel copyWith({
    TaximeterTariffPrices? tariff1,
    TaximeterTariffPrices? tariff2,
    TaximeterTariffPrices? tariff3,
  }) {
    return TaximeterTariffModel(
      tariff1: tariff1 ?? this.tariff1,
      tariff2: tariff2 ?? this.tariff2,
      tariff3: tariff3 ?? this.tariff3,
    );
  }

  TaximeterTariffPrices tariff(int o) {
    switch (o) {
      case 1:
        return tariff1;
      case 2:
        return tariff2;
      case 3:
        return tariff3;
      default:
        return tariff1;
    }
  }

  TaximeterTariffPrices nextTariff(int o) {
    switch (o) {
      case 1:
        return tariff2;
      case 2:
        return tariff3;
      case 3:
        return tariff1;
      default:
        return tariff1;
    }
  }

  Map<String, dynamic> get toMap => {
        'tariff1': tariff1.toMap(),
        'tariff2': tariff2.toMap(),
        'tariff3': tariff3.toMap(),
      };

  String toJson() => json.encode(toMap);
}

class TaximeterTariffPrices {
  const TaximeterTariffPrices({
    this.pricePerKM = 0,
    this.basePrice = 0,
    this.minimumPrice = 0,
    this.pricePerMin = 0,
  });

  factory TaximeterTariffPrices.fromMap(map) {
    if (map == null) return const TaximeterTariffPrices();
    return TaximeterTariffPrices(
      pricePerKM: map['pricePerKM'] as num? ?? 0,
      basePrice: map['basePrice'] as num? ?? 0,
      minimumPrice: map['minimumPrice'] as num? ?? 0,
      pricePerMin: map['pricePerMin'] as num? ?? 0,
    );
  }

  factory TaximeterTariffPrices.fromJson(String? source) {
    if (source == null) return const TaximeterTariffPrices();
    return TaximeterTariffPrices.fromMap(json.decode(source));
  }

  final num pricePerKM;
  final num basePrice;
  final num minimumPrice;
  final num pricePerMin;

  bool get validate {
    final ppk = pricePerKM == 0;
    final bp = basePrice == 0;
    final mp = minimumPrice == 0;
    final ppm = pricePerMin == 0;
    return (ppk && bp && mp && ppm) == false;
  }

  TaximeterTariffPrices copyWith({
    num? pricePerKM,
    num? basePrice,
    num? minimumPrice,
    num? pricePerMin,
  }) {
    return TaximeterTariffPrices(
      pricePerKM: pricePerKM ?? this.pricePerKM,
      basePrice: basePrice ?? this.basePrice,
      minimumPrice: minimumPrice ?? this.minimumPrice,
      pricePerMin: pricePerMin ?? this.pricePerMin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pricePerKM': pricePerKM,
      'basePrice': basePrice,
      'minimumPrice': minimumPrice,
      'pricePerMin': pricePerMin,
    };
  }

  String toJson() => json.encode(toMap());
}
