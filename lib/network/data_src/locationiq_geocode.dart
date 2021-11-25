import 'package:dio/dio.dart';
import 'package:tookwidgets/models/location_iq.dart';

class LocationIqGeocode{

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

  static const _host = 'https://us1.locationiq.com/v1/reverse.php';

  Future findAddressesFromCoordinates(
      String lat, String long) async {
    final url = '$_host?key=$apiKey&lat=${lat}&lat=${long}&format=json';
     await send(url);
     return;
  }

  Future<LocationIq> send(String url) async {
    final request = await _dio.get(_host);
    final Map data = request.data as Map;
    return LocationIq.fromJson(data);

  }

  }
