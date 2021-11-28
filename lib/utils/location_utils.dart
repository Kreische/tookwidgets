import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/models/address.dart';
import 'package:tookwidgets/models/location_iq.dart';
import 'package:tookwidgets/network/data_src/google_geocode.dart';
import 'package:tookwidgets/network/data_src/locationiq_geocode.dart';
import 'package:tookwidgets/plugin_config/config_variables.dart';

class LocationUtils {
  LocationUtils._singleton();

  static final LocationUtils instance = LocationUtils._singleton();

  late LatLng _currentLatLng;
  LatLng get currentLatLng => _currentLatLng;
  void setCurrentLanLng(LatLng l) => _currentLatLng = l;

  Address? _currentAddress;
  Address? get currentAddress => _currentAddress;

  GoogleGeocoding geocoding = GoogleGeocoding(ConfigVariable.googleApiKey);
  LocationIqGeocode locationIq =
      LocationIqGeocode(ConfigVariable.iqLocationKey);

  Future<Address> run() async {
    if (_currentAddress != null) return _currentAddress!;
    final res = await getLatest();
    return res;
  }

  Future<Address> getLatest() async {
    final res = await Geolocator.getCurrentPosition();
    final latlng = LatLng(res.latitude, res.longitude);
    setCurrentLanLng(latlng);
    final address = await getAddressFronCoordinates(latlng);
    return address;
  }

  Future<Address> getAddressFronCoordinates(LatLng coordinates) async {
    try {
      final res = await getIqLocationAddress(coordinates);
      print('IQ location');
      return res;
    } catch (e) {
      print(e);
      final googleAddress = await getAddressByGoogle(coordinates);
      print('GOogle');
      return googleAddress;
    }
  }

  Future<Address> getAddressByGoogle(LatLng latlng) async {
    final a = await geocoding.findAddressesFromCoordinates(latlng);
    return a.first.address;
  }

  Future<Address> getIqLocationAddress(LatLng latlng) async {
    final LocationIq a = await locationIq.findAddressesFromCoordinates(latlng);
    return a.getAddress;
  }
}
