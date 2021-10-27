import 'dart:convert';

import 'package:tookwidgets/Constants/AssetString.dart';
import 'package:tookwidgets/Constants/PluginStringData.dart';
import 'package:tookwidgets/Models/Enums/enums_functions.dart';
import 'Tuple.dart';

part './Enums/car_enums.dart';

class Car {
  Car({
    this.image,
    this.model,
    this.make,
    this.type,
    this.color,
    this.year = 2010,
    this.doors = 2,
    this.passengerCapasity = 1,
    this.registration,
    this.category = CarCategory.private,
  });

  factory Car.strictMap(map) {
    return Car(
      image: map['image'] as String?,
      model: map['carModel'] as String?,
      make: map['make'] as String?,
      type: map['type'] as String?, // getTypeFromMap(map['type'] as String),
      color: enumFromString<CarColor>(map['color'] as String?, CarColor.values),
      year: (map['year'] as int?) ?? 1990,
      doors: (map['doors'] as int?) ?? 2,
      passengerCapasity: (map['passengerCapasity'] as int?) ?? 1,
      registration: map['registration'] as String?,
      category: enumFromString<CarCategory>(
          map['category'] as String?, CarCategory.values),
    );
  }

  static Car? fromMap(map) {
    if (map == null) return null;
    return Car.strictMap(map);
  }

  final String? image;
  final String? make;
  final String? model;
  final String? type;
  final CarColor? color;
  final int? year;
  final int? doors;
  final int? passengerCapasity;
  final String? registration;
  final CarCategory? category;

  String? get doorCount {
    if (doors == null || doors! >= 4) return null;
    return '$doors doors';
  }

  String get name => '$make $year';

  String? get catagoryString {
    if (category == null || category == CarCategory.private) return null;
    return '${category?.getString}';
  }

  bool get incomplete =>
      image == null ||
      image!.isEmpty ||
      make == null ||
      model == null ||
      registration == null;

  Car copyWith({
    String? image,
    String? make,
    String? model,
    String? type,
    CarColor? color,
    int? year,
    int? doors,
    int? passengerCapasity,
    String? registration,
    CarCategory? category,
  }) {
    return Car(
      image: image ?? this.image,
      make: make ?? this.make,
      model: model ?? this.model,
      type: type ?? this.type,
      color: color ?? this.color,
      year: year ?? this.year,
      doors: doors ?? this.doors,
      passengerCapasity: passengerCapasity ?? this.passengerCapasity,
      registration: registration ?? this.registration,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> get toMap => {
        'image': image,
        'carModel': model,
        'make': make,
        'type': type,
        'color': color?.toMap,
        'year': year,
        'doors': doors,
        'passengerCapasity': passengerCapasity,
        'registration': registration,
        'category': category?.toMap,
      };

  String toJson() => json.encode(toMap);
}
