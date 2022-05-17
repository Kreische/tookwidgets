import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension PositionExt on Position? {
  LatLng get getLatlng => LatLng(this?.latitude ?? 0, this?.longitude ?? 0);

  CameraPosition get getCameraPosition => CameraPosition(
        target: getLatlng,
        zoom: 14,
      );
}

mixin PositionUtils {
  static dynamic validate(data) {
    return {
      'latitude': (data['latitude']).toDouble(),
      'longitude': (data['longitude']).toDouble(),
      'timestamp': data['timestamp'],
      'altitude': (data['altitude'] ?? 0.0).toDouble(),
      'accuracy': (data['accuracy'] ?? 0.0).toDouble(),
      'heading': (data['heading'] ?? 0.0).toDouble(),
      'floor': data['floor'],
      'speed': (data['speed'] ?? 0.0).toDouble(),
      'speedAccuracy': (data['speed_accuracy'] ?? 0.0).toDouble(),
      'isMocked': data['is_mocked'] ?? false,
    };
  }
}
