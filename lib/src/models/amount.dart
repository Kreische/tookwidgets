import 'dart:convert';

class Amount {
  const Amount({this.amount = 0, this.currency = 'usd'});

  factory Amount.fromMap(map) {
    return Amount(
      amount: (map['amount']?.toInt() as num?) ?? 0,
      currency: (map['currency'] as String?) ?? 'usd',
    );
  }
  factory Amount.fromJson(String source) => Amount.fromMap(json.decode(source));

  final num amount;
  final String currency;

  Map<String, dynamic> get toMap => {
        'amount': amount,
        'currency': currency,
      };

  String toJson() => json.encode(toMap);

  Amount copyWith({
    int? amount,
    String? currency,
  }) {
    return Amount(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }
}
