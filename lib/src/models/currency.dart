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




// class CurrencyData {
//   CurrencyData({
//     required this.code,
//     required this.name,
//     required this.symbol,
//     required this.flag,
//     required this.number,
//     required this.decimalDigits,
//     required this.namePlural,
//     required this.symbolOnLeft,
//     required this.decimalSeparator,
//     required this.thousandsSeparator,
//     required this.spaceBetweenAmountAndSymbol,
//   });

//   ///The currency code
//   final String code;

//   ///The currency name in English
//   final String name;

//   ///The currency symbol
//   final String symbol;

//   ///The currency flag code
//   ///
//   /// To get flag unicode(Emoji) use [CurrencyUtils.currencyToEmoji]
//   final String flag;

//   ///The currency number
//   final int number;

//   ///The currency decimal digits
//   final int decimalDigits;

//   ///The currency plural name in English
//   final String namePlural;

//   ///The decimal separator
//   final String decimalSeparator;

//   ///The thousands separator
//   final String thousandsSeparator;

//   ///True if symbol is on the Left of the amount
//   final bool symbolOnLeft;

//   ///True if symbol has space with amount
//   final bool spaceBetweenAmountAndSymbol;

//   CurrencyData copyWith({
//     String? code,
//     String? name,
//     String? symbol,
//     String? flag,
//     int? number,
//     int? decimalDigits,
//     String? namePlural,
//     String? decimalSeparator,
//     String? thousandsSeparator,
//     bool? symbolOnLeft,
//     bool? spaceBetweenAmountAndSymbol,
//   }) {
//     return CurrencyData(
//        code: code ?? this.code,
//       name: name ?? this.name,
//       symbol: symbol ?? this.symbol,
//       flag: flag ?? this.flag,
//       number: number ?? this.number,
//       decimalDigits: decimalDigits ?? this.decimalDigits,
//       namePlural: namePlural ?? this.namePlural,
//       decimalSeparator: decimalSeparator ?? this.decimalSeparator,
//       thousandsSeparator: thousandsSeparator ?? this.thousandsSeparator,
//       symbolOnLeft: symbolOnLeft ?? this.symbolOnLeft,
//       spaceBetweenAmountAndSymbol: spaceBetweenAmountAndSymbol ?? this.spaceBetweenAmountAndSymbol,
//     );
//   }
// }
