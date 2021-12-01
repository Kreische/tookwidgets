import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/models/google_services/google_directions.dart';
import 'package:tookwidgets/models/google_services/google_place_prediction.dart';
import 'package:tookwidgets/plugin_config/plugin_config_variables.dart';
import 'package:tookwidgets/utils/location_utils.dart';

class GoogleGeolocationService {
  Dio get dio => Dio();

  Future<List<PlacePrediction>> getPlacePredictions(String input) async {
    final url = _MapsDataSrcLinks.getPlacePredictions(input);
    final res = await dio.get(url);
    if (res.data['status'] as String == 'OK') {
      final List<PlacePrediction> _temp = [];
      for (final item in res.data['predictions']) {
        final predictions = PlacePrediction.fromMap(item);
        _temp.add(predictions);
      }
      return _temp;
    }
    throw Exception('Something went wrong');
  }

  Future<LatLng> getDataFromPlaceID(String? placeID) async {
    final res =
        await dio.get(_MapsDataSrcLinks.getGeometryFromPlaceID(placeID));
    if (res.data['status'] as String == 'OK') {
      final map = res.data['geometry'];
      return LatLng(
        map['location']['lat'] as double,
        map['location']['lng'] as double,
      );
    }
    throw Exception('Invalid Request');
  }

  Future<Direction> getDirection(LatLng from, LatLng to) async {
    final res = await dio.get(
      'https://maps.googleapis.com/maps/api/directions/json?',
      queryParameters: {
        'origin': '${from.latitude},${from.longitude}',
        'destination': '${to.latitude},${to.longitude}',
        'key': _MapsDataSrcLinks.apiKey,
      },
    );
    if (res.statusCode == 200) {
      return Direction.fromMap(res.data);
    }
    throw Exception('Something went wrong');
  }
}

mixin _MapsDataSrcLinks {
  // static String getAddressBylatlan(LatLng latlng) =>
  //     'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng.latitude},${latlng.longitude}&key=$apiKey';

  static String getPlacePredictions(String value) {
    final location = LocationUtils.instance.currentAddress?.latLng;
    final l = '${location?.latitude},${location?.longitude}';
    return 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$value&key=$apiKey&location=$l&radius=60000';
  }

  static String getGeometryFromPlaceID(String? placeID) =>
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&fields=geometry&key=$apiKey';

  static String get apiKey => PluginConfigVariable.googleApiKey;
}
