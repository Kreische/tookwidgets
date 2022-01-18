import 'dart:core';

class Tuple<T1, T2> {
  Tuple(this.item1, this.item2);

  factory Tuple.fromJson(Map<String, dynamic> json) {
    return Tuple(
      (json['item1'] as T1?)!,
      (json['item2'] as T2?)!,
    );
  }

  final T1 item1;
  final T2 item2;
}

class Tuple3<T1, T2, T3> {
  Tuple3(this.item1, this.item2, this.item3);

  factory Tuple3.fromJson(Map<String, dynamic> json) {
    return Tuple3(
      (json['item1'] as T1?)!,
      (json['item2'] as T2?)!,
      (json['item3'] as T3?)!,
    );
  }

  final T1 item1;
  final T2 item2;
  final T3 item3;
}
