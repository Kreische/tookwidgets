import 'dart:convert';

class AutoComplete {
  AutoComplete({
    this.placeId,
    this.osmId,
    this.osmType,
    this.licence,
    this.lat,
    this.lon,
    this.boundingbox,
    this.classs,
    this.type,
    this.displayName,
    this.displayPlace,
    this.displayAddress,
    this.address,
  });

  factory AutoComplete.fromMap(map) {
    return AutoComplete(
      placeId: map['place_id'] as String,
      osmId: map['osm_id'] as String,
      osmType: map['osm_type'] as String,
      licence: map['licence'] as String,
      lat: map['lat'] as num,
      lon: map['lon'] as num,
      boundingbox: List<String>.from(map['boundingbox'] as List),
      classs: map['class'] as String,
      type: map['type'] as String,
      displayName: map['display_name'] as String,
      displayPlace: map['display_place'] as String,
      displayAddress: map['display_address'] as String,
      address: Addresses.fromMap(map['address'] as Addresses),
    );
  }

  factory AutoComplete.fromJson(String source) =>
      AutoComplete.fromMap(json.decode(source));

  final String? placeId;
  final String? osmId;
  final String? osmType;
  final String? licence;
  final num? lat;
  final num? lon;
  final List<String>? boundingbox;
  final String? classs;
  final String? type;
  final String? displayName;
  final String? displayPlace;
  final String? displayAddress;
  final Addresses? address;

  AutoComplete copyWith({
    String? placeId,
    String? osmId,
    String? osmType,
    String? licence,
    num? lat,
    num? lon,
    List<String>? boundingbox,
    String? classs,
    String? type,
    String? displayName,
    String? displayPlace,
    String? displayAddress,
    Addresses? address,
  }) {
    return AutoComplete(
      placeId: placeId ?? this.placeId,
      osmId: osmId ?? this.osmId,
      osmType: osmType ?? this.osmType,
      licence: licence ?? this.licence,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      boundingbox: boundingbox ?? this.boundingbox,
      classs: classs ?? this.classs,
      type: type ?? this.type,
      displayName: displayName ?? this.displayName,
      displayPlace: displayPlace ?? this.displayPlace,
      displayAddress: displayAddress ?? this.displayAddress,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'place_id': placeId,
      'osm_id': osmId,
      'osm_type': osmType,
      'licence': licence,
      'lat': lat,
      'lon': lon,
      'boundingbox': boundingbox,
      'class': classs,
      'type': type,
      'display_name': displayName,
      'display_place': displayPlace,
      'display_address': displayAddress,
      'address': address?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}

class Addresses {
  Addresses({
    this.name,
    this.country,
    this.countryCode,
  });

  factory Addresses.fromMap(map) {
    return Addresses(
      name: map['name'] as String,
      country: map['country'] as String,
      countryCode: map['country_code'] as String,
    );
  }

  factory Addresses.fromJson(String source) =>
      Addresses.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  final String? name;
  final String? country;
  final String? countryCode;

  Addresses copyWith({
    String? name,
    String? country,
    String? countryCode,
  }) {
    return Addresses(
      name: name ?? this.name,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'country': country,
      'country_code': countryCode,
    };
  }
}
