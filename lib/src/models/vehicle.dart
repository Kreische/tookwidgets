import 'dart:convert';

import 'package:tookwidgets/src/models/enums/enums_functions.dart';
import 'package:tookwidgets/src/models/enums/vehicle_enums.dart';

class Vehicle {
  Vehicle({
    this.id,
    this.type = VehicleType.car,
    this.make,
    this.model,
    this.image,
    this.registration,
    this.bodyType = VehicleBodyType.suv,
    this.color = VehicleColor.white,
    this.year,
    this.doors = 2,
    this.passengerCapacity = 1,
    this.category = VehicleCategory.private,
    this.fuelType = VehicleFuelType.petrol,
  });

  factory Vehicle.fromMap(map) {
    return Vehicle(
      id: map['_id'] as String?,
      type: enumFromString<VehicleType>(
              map['type'] as String?, VehicleType.values) ??
          VehicleType.car,
      make: map['make'] as String? ?? '',
      model: map['model'] as String? ?? '',
      image: map['image'] as String?,
      registration: map['registration'] as String? ?? '',
      bodyType: enumFromString<VehicleBodyType>(
              map['bodyType'] as String?, VehicleBodyType.values) ??
          VehicleBodyType.hatchback,
      color: enumFromString<VehicleColor>(
              map['color'] as String?, VehicleColor.values) ??
          VehicleColor.white,
      year: DateTime.tryParse(
            map['year'] as String? ?? DateTime.now().toString(),
          )?.toLocal() ??
          DateTime.now(),
      doors: map['doors'] as int? ?? 2,
      passengerCapacity: map['passengerCapacity'] as int? ?? 1,
      category: enumFromString<VehicleCategory>(
              map['category'] as String?, VehicleCategory.values) ??
          VehicleCategory.private,
      fuelType: enumFromString<VehicleFuelType>(
              map['fuelType'] as String?, VehicleFuelType.values) ??
          VehicleFuelType.petrol,
    );
  }

  factory Vehicle.fromJson(String source) =>
      Vehicle.fromMap(json.decode(source));

  final String? id;
  final VehicleType type;
  final String? make;
  final String? model;
  final String? image;
  final String? registration;
  final VehicleBodyType bodyType;
  final VehicleColor color;
  final DateTime? year;
  final int doors;
  final int passengerCapacity;
  final VehicleCategory category;
  final VehicleFuelType fuelType;

  Vehicle copyWith({
    String? id,
    VehicleType? type,
    String? make,
    String? model,
    String? image,
    String? registration,
    VehicleBodyType? bodyType,
    VehicleColor? color,
    DateTime? year,
    int? doors,
    int? passengerCapacity,
    VehicleCategory? category,
    VehicleFuelType? fuelType,
  }) {
    return Vehicle(
      id: id ?? this.id,
      type: type ?? this.type,
      make: make ?? this.make,
      model: model ?? this.model,
      image: image ?? this.image,
      registration: registration ?? this.registration,
      bodyType: bodyType ?? this.bodyType,
      color: color ?? this.color,
      year: year ?? this.year,
      doors: doors ?? this.doors,
      passengerCapacity: passengerCapacity ?? this.passengerCapacity,
      category: category ?? this.category,
      fuelType: fuelType ?? this.fuelType,
    );
  }

  String get name {
    if ([VehicleType.car, VehicleType.motorbike, VehicleType.rikshaw]
        .contains(type)) return '$make $model';
    return 'Bicycle type';
  }

  bool validate() {
    if ([VehicleType.car, VehicleType.motorbike, VehicleType.rikshaw]
        .contains(type))
      return ![image, registration, make, model, year].contains(null);
    return ![image].contains(null);
  }

  Map<String, dynamic> get toMap => {
        '_id': id,
        'type': enumToString(type),
        'make': make,
        'model': model,
        'image': image,
        'registration': registration,
        'bodyType': enumToString(bodyType),
        'color': enumToString(color),
        'year': year?.toString(),
        'doors': doors,
        'passengerCapacity': passengerCapacity,
        'category': enumToString(category),
        'fuelType': enumToString(fuelType),
      };

  String toJson() => json.encode(toMap);
}
