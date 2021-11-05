import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/Models/GeocodeAddress.dart';

class GoogleGeocoding {
  GoogleGeocoding(
    this.apiKey, {
    this.language,
    this.headers,
    this.preserveHeaderCase = false,
  });

  final Dio _dio = Dio();

  final String apiKey;
  final String? language;
  final Map<String, Object>? headers;
  final bool preserveHeaderCase;

  static const _host = 'https://maps.google.com/maps/api/geocode/json';

  Future<List<GeocodeAddress>> findAddressesFromCoordinates(
      LatLng latlng) async {
    final url =
        '$_host?key=$apiKey${language != null ? '&language=' + language! : ''}&latlng=${latlng.latitude},${latlng.longitude}';
    return await _send(url) ?? const <GeocodeAddress>[];
  }

  Future<List<GeocodeAddress>?> _send(String url) async {
    final request = await _dio.get(url);

    final results = request.data['results'] as Iterable?;

    if (results == null) return null;

    return results
        .map(_convertAddress)
        .map<GeocodeAddress>((map) => GeocodeAddress.fromMap(map))
        .toList();
  }

  Map _convertAddress(data) {
    final Map result = {};

    result['placeId'] = data['place_id'];

    result['coordinates'] = _convertCoordinates(data['geometry']);
    result['addressLine'] = data['formatted_address'];

    final addressComponents = data['address_components'];

    addressComponents.forEach((item) {
      final types = item['types'] as Iterable;

      if (types.contains('route')) {
        result['thoroughfare'] = item['long_name'];
      } else if (types.contains('street_number')) {
        result['subThoroughfare'] = item['long_name'];
      } else if (types.contains('country')) {
        result['countryName'] = item['long_name'];
        result['countryCode'] = item['short_name'];
      } else if (types.contains('locality')) {
        result['locality'] = item['long_name'];
      } else if (types.contains('postal_code')) {
        result['postalCode'] = item['long_name'];
      } else if (types.contains('postal_code')) {
        result['postalCode'] = item['long_name'];
      } else if (types.contains('administrative_area_level_1')) {
        result['adminArea'] = item['long_name'];
        result['adminAreaCode'] = item['short_name'];
      } else if (types.contains('administrative_area_level_2')) {
        result['subAdminArea'] = item['long_name'];
      } else if (types.contains('sublocality') ||
          types.contains('sublocality_level_1')) {
        result['subLocality'] = item['long_name'];
      } else if (types.contains('premise')) {
        result['featureName'] = item['long_name'];
      }

      result['featureName'] = result['featureName'] ?? result['addressLine'];
    });

    return result;
  }

  Map? _convertCoordinates(geometry) {
    if (geometry == null) return null;

    final location = geometry['location'];
    if (location == null) return null;

    return {
      'latitude': location['lat'],
      'longitude': location['lng'],
    };
  }
}
