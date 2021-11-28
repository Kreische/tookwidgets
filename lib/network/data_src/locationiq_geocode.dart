import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/models/location_iq.dart';

class LocationIqGeocode {
  LocationIqGeocode(
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

  static const _host = 'https://us1.locationiq.com/v1/reverse.php?';
  static const _autoApi = 'https://api.locationiq.com/v1/autocomplete.php';

  Future<LocationIq> findAddressesFromCoordinates(LatLng latlng) async {
    final url =
        '$_host?key=$apiKey&lat=${latlng.latitude}&lat=${latlng.longitude}&format=json';
    final address = await _send(url);
    return LocationIq.fromMap(address);
  }

  Future<List<LocationIq>> listOfAddresses(String search) async {
    final url = '$_autoApi?key=$apiKey&q=$search&limit=5';
    final res = await _send(url);
    final autoComplete = List<LocationIq>.from(
        res.map((e) => LocationIq.fromMap(e)) as Iterable);
    return autoComplete;
  }

  Future _send(String url) async {
    final request = await _dio.get(url);
    return request.data;
  }
}
