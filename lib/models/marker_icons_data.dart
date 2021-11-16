import 'package:tookwidgets/models/car.dart';

class MarkerIconsData {
  MarkerIconsData({
    required this.mapPointA,
    required this.mapPointB,
    this.customer,
    this.activeCustomer,
    this.myCarColor,
  });

  final String mapPointA;
  final String mapPointB;
  final String? customer;
  final String? activeCustomer;
  final CarColor? myCarColor;
}
