import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/utils/direction_utils.dart';

class Direction {
  const Direction({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory Direction.fromMap(map) {
    // Check if route is not available
    if ((map['routes'] as Iterable).isEmpty)
      throw Exception('Route is not available');

    // Get route information
    final data = Map<String, dynamic>.from(map['routes'][0] as Map);

    // Bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'] as double, northeast['lng'] as double),
      southwest: LatLng(southwest['lat'] as double, southwest['lng'] as double),
    );

    // Distance & Duration
    int? distanceInMeter = 0;
    int? durationInMin = 0;
    if ((data['legs'] as Iterable).isNotEmpty) {
      final leg = data['legs'][0];
      distanceInMeter = leg['distance']['value'] as int?;
      durationInMin = leg['duration']['value'] as int?;
    }

    return Direction(
      bounds: bounds,
      polylinePoints: DirectionUtils.decodeEncodedPolyline(
          data['overview_polyline']['points'] as String),
      totalDistance: (distanceInMeter! / 1000).toDouble(),
      totalDuration: durationInMin,
    );
  }

  final LatLngBounds bounds;
  final List<LatLng> polylinePoints;
  final double totalDistance;
  final int? totalDuration;
}
