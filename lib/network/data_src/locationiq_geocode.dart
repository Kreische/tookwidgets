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

  static const _host = 'https://us1.locationiq.com/v1/reverse.php?key=pk.969e7a7923964fa6b654194e0de8334f&lat=30.3753&lon=69.3451&format=json';

  findAddressesFromCoordinates(
      String lat, String long) async {
    final url = '$_host?key=$apiKey&lat=${lat}&lat=${long}&format=json';
    return await send(url);
  }

  send(String url) async {
    var request = await _dio.get(_host);
    Map data = request.data as Map;
    LocationIq.fromJson(data);




  }

  }
