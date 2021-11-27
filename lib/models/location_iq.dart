import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/models/address.dart';

class LocationIq {
  LocationIq({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    required this.lat,
    required this.lon,
    required this.displayName,
    this.address,
    this.boundingbox,
  });

  factory LocationIq.fromMap(map) {
    return LocationIq(
      placeId: map['place_id'] as String,
      licence: map['licence'] as String,
      osmType: map['osm_type'] as String,
      osmId: map['osm_id'] as String,
      lat: map['lat'] as num,
      lon: map['lon'] as num,
      displayName: map['display_name'] as String,
      address: AddressCode.fromMap(map['address'] as String),
      boundingbox: List<String>.from(map['boundingbox'] as List),
    );
  }

  factory LocationIq.fromJson(String source) =>
      LocationIq.fromMap(json.decode(source));

  final String? placeId;
  final String? licence;
  final String? osmType;
  final String? osmId;
  final num lat;
  final num lon;
  final String displayName;
  final AddressCode? address;
  final List<String>? boundingbox;

  LocationIq copyWith({
    String? placeId,
    String? licence,
    String? osmType,
    String? osmId,
    num? lat,
    num? lon,
    String? displayName,
    AddressCode? address,
    List<String>? boundingbox,
  }) {
    return LocationIq(
      placeId: placeId ?? this.placeId,
      licence: licence ?? this.licence,
      osmType: osmType ?? this.osmType,
      osmId: osmId ?? this.osmId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      displayName: displayName ?? this.displayName,
      address: address ?? this.address,
      boundingbox: boundingbox ?? this.boundingbox,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'place_id': placeId,
      'licence': licence,
      'osm_type': osmType,
      'osm_id': osmId,
      'lat': lat,
      'lon': lon,
      'display_name': displayName,
      'address': address!.toMap(),
      'boundingbox': boundingbox,
    };
  }

  String toJson() => json.encode(toMap());
}

class AddressCode {
  AddressCode({
    required this.county,
    required this.state,
    required this.country,
    required this.countryCode,
  });

  factory AddressCode.fromMap(map) {
    return AddressCode(
      county: map['county'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      countryCode: map['country_code'] as String,
    );
  }

  factory AddressCode.fromJson(String source) =>
      AddressCode.fromMap(json.decode(source));

  final String county;
  final String state;
  final String country;
  final String countryCode;

  AddressCode copyWith({
    String? county,
    String? state,
    String? country,
    String? countryCode,
  }) {
    return AddressCode(
      county: county ?? this.county,
      state: state ?? this.state,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'county': county,
      'state': state,
      'country': country,
      'country_code': countryCode,
    };
  }

  String toJson() => json.encode(toMap());
}

extension IqLocationExt on LocationIq {
  Address get getAddress {
    return Address(
      placeId: placeId,
      formatedAddress: displayName,
      latLng: LatLng(lat.toDouble(), lon.toDouble()),
      stateAndCountry: address!.state,
    );
  }
}
