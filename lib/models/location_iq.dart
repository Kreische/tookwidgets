import 'package:tookwidgets/models/address.dart';

class LocationIq {
  LocationIq({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.displayName,
    required this.address,
    required this.boundingbox,
  });
  late final String placeId;
  late final String licence;
  late final String osmType;
  late final String osmId;
  late final String lat;
  late final String lon;
  late final String displayName;
  late final AddressCode address;
  late final List<String> boundingbox;

  LocationIq.fromJson(Map<dynamic, dynamic> json){
    placeId = json['place_id'] as String;
    licence = json['licence'] as String;
    osmType = json['osm_type'] as String;
    osmId = json['osm_id'] as String;
    lat = json['lat'] as String;
    lon = json['lon'] as String;
    displayName = json['display_name'] as String;
    address = AddressCode.fromJson(json['address'] as Map);
    boundingbox = json['boundingbox'] as List<String>;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['place_id'] = placeId;
    _data['licence'] = licence;
    _data['osm_type'] = osmType;
    _data['osm_id'] = osmId;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['display_name'] = displayName;
    _data['address'] = address.toJson();
    _data['boundingbox'] = boundingbox;
    return _data;
  }
}

class AddressCode {
  AddressCode({
    required this.county,
    required this.state,
    required this.country,
    required this.countryCode,
  });
  late final String county;
  late final String state;
  late final String country;
  late final String countryCode;

  factory AddressCode.fromJson(Map<dynamic, dynamic> json){
    return AddressCode(
        county: json['county'] as String,
        state: json['state'] as String,
        country: json['country'] as String,
        countryCode: json['country_code'] as String);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['county'] = county;
    _data['state'] = state;
    _data['country'] = country;
    _data['country_code'] = countryCode;
    return _data;
  }



}