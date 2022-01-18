part of '../models/enums/driver_enums.dart';

extension CarFuelTypeExt on CarFuelType {
  String get name {
    switch (this) {
      case CarFuelType.electric:
        return '100% Electric';
      case CarFuelType.pluginHybrid:
        return 'Plugin Hybrid';
      case CarFuelType.hybrid:
        return 'Hybrid';
      case CarFuelType.naturalGas:
        return 'Natural Gas';
      case CarFuelType.hydrogen:
        return 'Hydrogen';
      case CarFuelType.petrol:
        return 'Petrol';
      case CarFuelType.diesel:
        return 'Diesel';
      default:
        return '';
    }
  }
}
