import 'dart:convert';

import 'package:tookwidgets/src/models/enums/enums_functions.dart';
import 'package:tookwidgets/src/models/enums/vehicle_enums.dart';

class Vehicle {
  Vehicle({
    this.id,
    this.type,
    this.image,
    this.model,
    this.make,
    this.bodyType,
    this.color,
    this.year = 2010,
    this.doors = 2,
    this.passengerCapacity = 1,
    this.registration,
    this.category = VehicleCategory.private,
    this.fuelType = VehicleFuelType.petrol,
  });

  static Vehicle? fromMap(map) {
    if (map == null) return null;
    return Vehicle(
      id: map['_id'] as String?,
      type: enumFromString<VehicleType>(
          map['type'] as String?, VehicleType.values),
      image: map['image'] as String?,
      model: map['model'] as String?,
      make: map['make'] as String?,
      bodyType: map['bodytype'] as String?,
      color: enumFromString<VehicleColor>(
          map['color'] as String?, VehicleColor.values),
      year: (map['year'] as int?) ?? 1990,
      doors: (map['doors'] as int?) ?? 2,
      passengerCapacity: (map['passengerCapacity'] as int?) ?? 1,
      registration: map['registration'] as String?,
      category: enumFromString<VehicleCategory>(
          map['category'] as String?, VehicleCategory.values),
      fuelType: map['fuelType'] == null
          ? VehicleFuelType.petrol
          : (enumFromString<VehicleFuelType>(
                  map['fuelType'] as String, VehicleFuelType.values) ??
              VehicleFuelType.petrol),
    );
  }

  final VehicleType? type;
  final String? image;
  final String? model;
  final String? make;
  final String? bodyType;
  final VehicleColor? color;
  final int? year;
  final int? doors;
  final int? passengerCapacity;
  final String? registration;
  final VehicleCategory? category;
  final VehicleFuelType fuelType;
  final String? id;

  String? get doorCount {
    if (doors == null || doors! >= 4) return null;
    return '$doors doors';
  }

  String get name => '$make $year';

  String? get catagoryString {
    if (category == null || category == VehicleCategory.private) return null;
    return '${category?.getString}';
  }

  bool get incomplete =>
      image == null ||
      image!.isEmpty ||
      make == null ||
      model == null ||
      registration == null;

  Vehicle copyWith({
    String? id,
    VehicleType? type,
    String? image,
    String? model,
    String? make,
    String? bodyType,
    VehicleColor? color,
    int? year,
    int? doors,
    int? passengerCapacity,
    String? registration,
    VehicleCategory? category,
    VehicleFuelType? fuelType,
  }) {
    return Vehicle(
      id: id ?? this.id,
      type: type ?? this.type,
      image: image ?? this.image,
      make: make ?? this.make,
      model: model ?? this.model,
      bodyType: bodyType ?? this.bodyType,
      color: color ?? this.color,
      year: year ?? this.year,
      doors: doors ?? this.doors,
      passengerCapacity: passengerCapacity ?? this.passengerCapacity,
      registration: registration ?? this.registration,
      category: category ?? this.category,
      fuelType: fuelType ?? this.fuelType,
    );
  }

  Map<String, dynamic> get toMap => {
        'id': id,
        'type': enumToString(type),
        'image': image,
        'model': model,
        'make': make,
        'bodytype': bodyType,
        'color': color?.toMap,
        'year': year,
        'doors': doors,
        'passengerCapacity': passengerCapacity,
        'registration': registration,
        'category': enumToString(category),
        'fuelType': enumToString(fuelType)
      };

  String toJson() => json.encode(toMap);
}
