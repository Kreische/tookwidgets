import 'package:background_location/background_location.dart';
import 'package:geolocator/geolocator.dart';

extension LocationExt on Location {
  Position get position {
    return Position(
        longitude: longitude!,
        latitude: latitude!,
        timestamp: DateTime.now(),
        accuracy: accuracy!,
        altitude: altitude!,
        heading: bearing!,
        speed: speed!,
        speedAccuracy: 0.0);
  }
}
