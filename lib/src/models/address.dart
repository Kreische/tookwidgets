import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address {
  Address({
    required this.placeId,
    required this.formatedAddress,
    required this.latLng,
    required this.stateAndCountry,
    required this.countryCode,
  });

  static Address? fromMap(map) {
    if (map == null) return null;
    if (map == '') return null;
    return Address(
      placeId: map['placeId'] as String?,
      formatedAddress: map['formatedAddress'] as String,
      latLng: LatLng(
        map['latLng']['latitude'] as double,
        map['latLng']['longitude'] as double,
      ),
      stateAndCountry: map['stateAndCountry'] as String?,
      countryCode: map['countryCode'] as String?,
    );
  }

  Map<String, dynamic> get toMap => {
        'placeId': placeId,
        'formatedAddress': formatedAddress,
        'latLng': {
          'latitude': latLng.latitude,
          'longitude': latLng.longitude,
        },
        'stateAndCountry': stateAndCountry,
        'countryCode': countryCode,
      };

  final String formatedAddress;
  final LatLng latLng;
  final String? placeId;
  final String? stateAndCountry;
  final String? countryCode;

  static Address? fromJson(String source) =>
      Address.fromMap(json.decode(source));

  String toJson() => json.encode(toMap);
}

String getStateAndCountryFromMap(map) {
  final formatedAddress = map['formatted_address'] as String;
  final splited = formatedAddress.split(' ');
  final country = splited.last;
  final state = splited[splited.length - 2];
  final res = state + country;
  return res;
}

class PersonalAddress {
  PersonalAddress({
    this.address,
    this.country,
    this.state,
    this.city,
    this.location,
  });

  static PersonalAddress? fromMap(map) {
    if (map == null) return null;
    if (map == '') return null;
    return PersonalAddress(
      address: map['address'] as String?,
      country: map['country'] as String?,
      state: map['state'] as String?,
      city: map['city'] as String?,
      location: MongoLocation?.fromMap(map['location']),
    );
  }

  final String? city;
  final String? address;
  final String? country;
  final String? state;
  final MongoLocation? location;

  PersonalAddress copyWith({
    String? address,
    String? country,
    String? state,
    String? city,
    MongoLocation? location,
  }) {
    return PersonalAddress(
      address: address ?? this.address,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> get toMap => {
        'address': address,
        'country': country,
        'state': state,
        'city': city,
        'location': location?.toMap,
      };
}

class MongoLocation {
  const MongoLocation({
    this.type = 'Point',
    this.coordinates,
    this.updatedAt,
    this.heading = 0,
    this.latitude = 0,
    this.longitude = 0,
    this.speed = 0,
  });

  static MongoLocation? fromMap(map) {
    if (map == null || map is String) return null;
    if (map is Map && map.isEmpty) return null;
    if (map['coordinates'] == null) return null;
    try {
      return MongoLocation(
        type: (map['type'] ?? 'Point') as String,
        coordinates: List<num>.from(map['coordinates'] as Iterable),
        updatedAt: map['updatedAt'] != null
            ? DateTime.tryParse((map['updatedAt'] ?? '') as String)
            : null,
        heading: (map['heading'] ?? 0) as num,
        latitude: (map['latitude'] ?? 0) as num,
        longitude: (map['longitude'] ?? 0) as num,
        speed: (map['speed'] ?? 0) as num,
      );
    } catch (e) {
      return null;
    }
  }

  final String? type;
  final List<num>? coordinates;
  final DateTime? updatedAt;
  final num heading;
  final num latitude;
  final num longitude;
  final num speed;

  MongoLocation copyWith({
    String? type,
    List<num>? coordinates,
    DateTime? updatedAt,
    num? heading,
    num? latitude,
    num? longitude,
    num? speed,
  }) {
    return MongoLocation(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
      heading: heading ?? this.heading,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      speed: speed ?? this.speed,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> get toMap => {
        'type': 'Point',
        'coordinates': coordinates,
        'updatedAt': updatedAt?.toIso8601String(),
        'heading': heading,
        'latitude': latitude,
        'longitude': longitude,
        'speed': speed,
      };

  LatLng? get latlng => LatLng(
        coordinates![1].toDouble(),
        coordinates![0].toDouble(),
      );

  String toJson() => json.encode(toMap);

  static MongoLocation? fromJson(String source) =>
      MongoLocation.fromMap(json.decode(source));
}
