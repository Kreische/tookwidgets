import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/Config/config_variables.dart';
import 'package:tookwidgets/Models/GeocodeAddress.dart';
import 'package:tookwidgets/network/data_src/google_geocode.dart';

class LocationUtils {
  LocationUtils._singleton();

  static final LocationUtils instance = LocationUtils._singleton();

  GeocodeAddress? _currentAddress;
  GeocodeAddress? get currentAddress => _currentAddress;

  GoogleGeocoding geocoding = GoogleGeocoding(ConfigVariable.googleApiKey);

  Future<GeocodeAddress> run() async {
    if (_currentAddress != null) return _currentAddress!;
    final res = await Geolocator.getCurrentPosition();
    final LatLng latlng = LatLng(res.latitude, res.longitude);
    final a = await geocoding.findAddressesFromCoordinates(latlng);
    _currentAddress = a.first;
    return a.first;
  }
}
