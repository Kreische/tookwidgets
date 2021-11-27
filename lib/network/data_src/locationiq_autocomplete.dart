import 'package:dio/dio.dart';
import 'package:tookwidgets/models/autocomplete.dart';

class LocationIqAutoComplete {
  LocationIqAutoComplete(
    this.apiKey, {
    this.headers,
    this.preserveHeaderCase = false,
  });

  final Dio _dio = Dio();

  final String apiKey;
  final Map<String, Object>? headers;
  final bool preserveHeaderCase;

  static const _host = 'https://api.locationiq.com/v1/autocomplete.php';

  Future<List<AutoComplete>> listOfAddresses(String search) async {
    final url = '$_host?key=$apiKey&q$search';
    final address = await send(url);

    return AutoComplete.fromMap(address) as List<AutoComplete>;
  }

  Future send(String url) async {
    final request = await _dio.get(url);
    final Map data = request.data as Map;
    return data;
  }
}
