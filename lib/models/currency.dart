import 'dart:convert';

class CurrencyData {
  CurrencyData({
    required this.country,
    required this.countryCode,
    required this.currency,
    required this.currencyCode,
  });

  factory CurrencyData.fromMap(map) {
    return CurrencyData(
      country: map['country'] as String,
      countryCode: map['countryCode'] as String,
      currency: map['currency'] as String,
      currencyCode: map['currencyCode'] as String,
    );
  }

  factory CurrencyData.fromJson(String source) =>
      CurrencyData.fromMap(json.decode(source));

  final String country;
  final String countryCode;
  final String currency;
  final String currencyCode;

  CurrencyData copyWith({
    String? country,
    String? countryCode,
    String? currency,
    String? currencyCode,
  }) {
    return CurrencyData(
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      currency: currency ?? this.currency,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  Map<String, dynamic> get toMap => {
        'country': country,
        'countryCode': countryCode,
        'currency': currency,
        'currencyCode': currencyCode,
      };

  String toJson() => json.encode(toMap);
}
