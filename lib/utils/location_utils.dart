import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/models/geocode_address.dart';
import 'package:tookwidgets/network/data_src/google_geocode.dart';
import 'package:tookwidgets/plugin_config/config_variables.dart';

class LocationUtils {
  LocationUtils._singleton();

  static final LocationUtils instance = LocationUtils._singleton();

  late LatLng _currentLatLng;
  LatLng get currentLatLng => _currentLatLng;
  void setCurrentLanLng(LatLng l) => _currentLatLng = l;

  GeocodeAddress? _currentAddress;
  GeocodeAddress? get currentAddress => _currentAddress;

  GoogleGeocoding geocoding = GoogleGeocoding(ConfigVariable.googleApiKey);

  Future<GeocodeAddress> run() async {
    if (_currentAddress != null) return _currentAddress!;
    final res = getLatest();
    return res;
  }

  Future<GeocodeAddress> getLatest() async {
    final res = await Geolocator.getCurrentPosition();
    final latlng = LatLng(res.latitude, res.longitude);
    print(latlng.toJson());
    setCurrentLanLng(latlng);
    final a = await geocoding.findAddressesFromCoordinates(latlng);
    print(a.length);
    _currentAddress = a.first;
    return a.first;
  }
}
