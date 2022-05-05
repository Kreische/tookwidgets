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

  factory Address.fromLinkMap(map) {
    return Address(
      placeId: map['place_id'] as String?,
      formatedAddress: map['formatted_address'] as String,
      latLng: linkTolatLngFromMap(map['geometry']),
      stateAndCountry: getStateAndCountryFromMap(map),
      countryCode: map['country_code'] as String,
    );
  }

  static Address? fromApiMap(map) {
    if (map == null) return null;
    if (map == '') return null;
    return Address(
      placeId: map['placeId'] as String?,
      formatedAddress: map['formatedAddress'] as String,
      latLng: apiToLantLanFromMap(map['latLng']),
      stateAndCountry: map['stateAndCountry'] as String?,
      countryCode: map['countryCode'] as String?,
    );
  }

  Map<String, dynamic> get toMap => {
        'placeId': placeId,
        'formatedAddress': formatedAddress,
        'latLng': latLngToApiMap(latLng),
        'stateAndCountry': stateAndCountry,
        'countryCode': countryCode,
      };

  final String formatedAddress;
  final LatLng latLng;
  final String? placeId;
  final String? stateAndCountry;
  final String? countryCode;

  static Address? fromJson(String source) =>
      Address.fromApiMap(json.decode(source));

  String toJson() => json.encode(toMap);
}

LatLng linkTolatLngFromMap(map) {
  return LatLng(
      map['location']['lat'] as double, map['location']['lng'] as double);
}

LatLng apiToLantLanFromMap(map) => LatLng(
      map['latitude'] as double,
      map['longitude'] as double,
    );

Map<String, dynamic> latLngToApiMap(LatLng latLng) => {
      'latitude': latLng.latitude,
      'longitude': latLng.longitude,
    };

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
    return MongoLocation(
      type: map['type'] as String?,
      coordinates: List<num>.from(map['coordinates'] as Iterable),
      heading: map['heading'] as num? ?? 0,
      latitude: map['latitude'] as num? ?? 0,
      longitude: map['longitude'] as num? ?? 0,
      speed: map['speed'] as num? ?? 0,
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ??
          DateTime.now(),
    );
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
        'updatedAt': updatedAt,
        'heading': heading,
        'latitude': latitude,
        'longitude': longitude,
        'speed': speed,
      };

  LatLng? get latlng => LatLng(latitude.toDouble(), longitude.toDouble());
}
