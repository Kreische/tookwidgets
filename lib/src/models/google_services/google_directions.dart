import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/src/utils/direction_utils.dart';

import '../enums/display_units.dart';

class Direction {
  const Direction({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.distanceInMeter,
    required this.totalDuration,
    required this.encodedPolyline,
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
      distanceInMeter: distanceInMeter,
      totalDuration: durationInMin,
      encodedPolyline: data['overview_polyline']['points'] as String,
    );
  }

  String displayDistance(DistanceMeasureUnit unit) {
    switch (unit) {
      case DistanceMeasureUnit.kilometer:
        return '${(distanceInMeter / 1000).toStringAsFixed(2)}kms';
      case DistanceMeasureUnit.mile:
        final mi = distanceInMeter * 0.621371;
        return '${mi.toStringAsFixed(2)}mi';
      default:
        return '${(distanceInMeter / 1000).toStringAsFixed(2)}kms';
    }
  }

  final LatLngBounds bounds;
  final List<LatLng> polylinePoints;
  final double totalDistance;
  final int distanceInMeter;
  final int? totalDuration;
  final String encodedPolyline;
}
