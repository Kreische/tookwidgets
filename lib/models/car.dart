import 'dart:convert';

import 'package:tookwidgets/models/enums/enums_functions.dart';
import 'package:tookwidgets/models/tuple.dart';
import 'package:tookwidgets/plugin_consts/plugin_asset_strings.dart';
import 'package:tookwidgets/plugin_consts/plugin_string_data.dart';

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

  static Car? fromMap(map) {
    if (map == null) return null;
    return Car(
      image: map['image'] as String?,
      model: map['carModel'] as String?,
      make: map['make'] as String?,
      type: map['type'] as String?,
      color: enumFromString<CarColor>(map['color'] as String?, CarColor.values),
      year: (map['year'] as int?) ?? 1990,
      doors: (map['doors'] as int?) ?? 2,
      passengerCapasity: (map['passengerCapasity'] as int?) ?? 1,
      registration: map['registration'] as String?,
      category: enumFromString<CarCategory>(
          map['category'] as String?, CarCategory.values),
    );
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

enum CarColor {
  white,
  red,
  green,
  yellow,
  black,
  orange,
  brown,
  purple,
  pink,
  silver,
  lightBlue,
  darkBlue,
  darkGrey,
  lightGreen,
}

enum CarCategory { private, taxi }

extension CarCategoryExtension on CarCategory {
  String get toMap => toString().split('.').last;

  String? get getString {
    switch (this) {
      case CarCategory.private:
        return PluginStringData.private;
      case CarCategory.taxi:
        return PluginStringData.taxi;
      default:
        return PluginStringData.private;
    }
  }
}

extension CarColorExtension on CarColor {
  String get toMap => toString().split('.').last;

  Tuple<String, String> get param {
    switch (this) {
      case CarColor.white:
        return Tuple(
          CarAssetString.white,
          'White',
        );
      case CarColor.brown:
        return Tuple(
          CarAssetString.brown,
          'Brown',
        );
      case CarColor.red:
        return Tuple(
          CarAssetString.red,
          'Red',
        );
      case CarColor.green:
        return Tuple(
          CarAssetString.green,
          'Green',
        );
      case CarColor.black:
        return Tuple(
          CarAssetString.black,
          'Black',
        );
      case CarColor.orange:
        return Tuple(
          CarAssetString.orange,
          'Orange',
        );
      case CarColor.purple:
        return Tuple(
          CarAssetString.purple,
          'Purple',
        );
      case CarColor.pink:
        return Tuple(
          CarAssetString.pink,
          'Pink',
        );
      case CarColor.silver:
        return Tuple(
          CarAssetString.silver,
          'Silver',
        );
      case CarColor.lightBlue:
        return Tuple(
          CarAssetString.lightBlue,
          'Ligh Blue',
        );
      case CarColor.darkBlue:
        return Tuple(
          CarAssetString.darkBlue,
          'Dark Blue',
        );
      case CarColor.darkGrey:
        return Tuple(
          CarAssetString.darkGrey,
          'Dark Grey',
        );
      case CarColor.lightGreen:
        return Tuple(
          CarAssetString.lightGreen,
          'Ligh Green',
        );
      case CarColor.yellow:
        return Tuple(
          CarAssetString.yellow,
          'Yellow',
        );
      default:
        return Tuple(CarAssetString.white, 'White');
    }
  }

  String get title => toString().split('.').last.capitalize;

  String get image {
    switch (this) {
      case CarColor.white:
        return CarAssetString.white;
      case CarColor.brown:
        return CarAssetString.brown;
      case CarColor.red:
        return CarAssetString.red;
      case CarColor.green:
        return CarAssetString.green;
      case CarColor.black:
        return CarAssetString.black;
      case CarColor.orange:
        return CarAssetString.orange;
      case CarColor.purple:
        return CarAssetString.purple;
      case CarColor.pink:
        return CarAssetString.pink;
      case CarColor.silver:
        return CarAssetString.silver;
      case CarColor.lightBlue:
        return CarAssetString.lightBlue;
      case CarColor.darkBlue:
        return CarAssetString.darkBlue;
      case CarColor.darkGrey:
        return CarAssetString.darkGrey;
      case CarColor.lightGreen:
        return CarAssetString.lightGreen;
      case CarColor.yellow:
        return CarAssetString.yellow;
      default:
        return CarAssetString.white;
    }
  }
}

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}
