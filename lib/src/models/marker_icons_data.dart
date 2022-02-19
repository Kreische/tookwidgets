import 'package:tookwidgets/src/models/enums/vehicle_enums.dart';

class MarkerIconsData {
  MarkerIconsData({
    required this.mapPointA,
    required this.mapPointB,
    this.customer,
    this.activeCustomer,
    this.vehicleColor,
  });

  final String mapPointA;
  final String mapPointB;
  final String? customer;
  final String? activeCustomer;
  final VehicleColor? vehicleColor;
}
