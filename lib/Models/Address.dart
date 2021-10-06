import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address {
  Address({
    required this.placeId,
    required this.formatedAddress,
    required this.latLng,
    required this.stateAndCountry,
  });

  factory Address.fromLinkMap(map) {
    return Address(
      placeId: map['place_id'] as String?,
      formatedAddress: map['formatted_address'] as String,
      latLng: linkTolatLngFromMap(map['geometry']),
      stateAndCountry: getStateAndCountryFromMap(map),
    );
  }

  static Address? fromApiMap(map) {
    if (map == null) return null;
    return Address(
      placeId: map['placeId'] as String?,
      formatedAddress: map['formatedAddress'] as String,
      latLng: apiToLantLanFromMap(map['latLng']),
      stateAndCountry: map['stateAndCountry'] as String?,
    );
  }

  Map<String, dynamic> get toMap => {
        'placeId': placeId,
        'formatedAddress': formatedAddress,
        'latLng': latLngToApiMap(latLng),
        'stateAndCountry': stateAndCountry,
      };

  final String formatedAddress;
  final LatLng latLng;
  final String? placeId;
  final String? stateAndCountry;
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

  factory PersonalAddress.fromMap(map) {
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
  });

  static MongoLocation? fromMap(map) {
    if (map == null || (map as Map).isEmpty) return null;
    return MongoLocation(
      type: map['type'] as String?,
      coordinates: List<num>.from(map['coordinates'] as Iterable),
    );
  }

  final String? type;
  final List<num>? coordinates;

  MongoLocation copyWith({
    String? type,
    List<num>? coordinates,
  }) {
    return MongoLocation(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> get toMap => {
        'type': 'Point',
        'coordinates': coordinates,
      };

  LatLng? get latlng =>
      LatLng(coordinates?[1] as double, coordinates?.first as double);
}
