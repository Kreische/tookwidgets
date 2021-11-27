import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/plugin_config/config_variables.dart';
import 'package:tookwidgets/utils/location_utils.dart';

class MapsDataSrc {
  final Dio dio = Dio();

  Future getAddress(LatLng latlng) async {
    final res = await dio.get(
      MapsDataSrcLinks.getAddressBylatlan(latlng),
    );
    return res;
  }

  Future getPlacePredictions(String input) async {
    final url = MapsDataSrcLinks.getPlacePredictions(input);
    final res = await dio.get(url);
    return res;
  }

  Future getDataFromPlaceID(String? placeID) async {
    final res = await dio.get(MapsDataSrcLinks.getDataFromPlaceID(placeID));
    return res;
  }

  Future getDirection(LatLng from, LatLng to) async {
    final res = await dio.get(
      'https://maps.googleapis.com/maps/api/directions/json?',
      queryParameters: {
        'origin': '${from.latitude},${from.longitude}',
        'destination': '${to.latitude},${to.longitude}',
        'key': MapsDataSrcLinks.apiKey,
      },
    );
    return res;
  }
}

mixin MapsDataSrcLinks {
  static String getAddressBylatlan(LatLng latlng) =>
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng.latitude},${latlng.longitude}&key=$apiKey';

  static String getPlacePredictions(String value) {
    final location = LocationUtils.instance.currentAddress?.latLng;
    final l = '${location?.latitude},${location?.longitude}';
    return 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$value&key=$apiKey&location=$l&radius=60000';
  }

  static String getDataFromPlaceID(String? placeID) =>
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&fields=formatted_address,geometry,place_id&key=$apiKey';

  static const apiKey = ConfigVariable.googleApiKey;
}
