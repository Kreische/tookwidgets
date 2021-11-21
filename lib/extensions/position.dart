import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension PositionExt on Position? {
  LatLng get getLatlng =>
      LatLng(this?.latitude ?? 27.2046, this?.longitude ?? 77.4977);

  CameraPosition get getCameraPosition => CameraPosition(
        target: getLatlng,
        zoom: 15,
      );
}
