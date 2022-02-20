part of '../models/enums/vehicle_enums.dart';

extension VehicleCategoryExtension on VehicleCategory {
  String? get getString {
    switch (this) {
      case VehicleCategory.private:
        return 'Private';
      case VehicleCategory.taxi:
        return 'Taxi';
      default:
        return 'Private';
    }
  }
}

extension VehicleTypeExtention on VehicleType {
  String get title => name.capitalize;

  Tuple<String, String> get getDefautValue {
    switch (this) {
      case VehicleType.car:
        return Tuple('Upload image', 'assets/Icons/car_icon.png');
      case VehicleType.motorbike:
        return Tuple('Upload image', 'assets/Images/img_motorcycle.png');
      default:
        return Tuple('Upload image', 'assets/Icons/car_icon.png');
    }
  }
}

extension VehicleColorExtention on VehicleColor {
  String get toMap => toString().split('.').last;

  Tuple<String, String> param(VehicleType vehicalTypes) {
    switch (vehicalTypes) {
      case VehicleType.car:
        return getCarParam(this);
      case VehicleType.motorbike:
        return getMotorbikeParam(this);

      default:
        return Tuple(CarAssetString.white, 'White');
    }
  }

  Tuple<String, String> getCarParam(VehicleColor vehicalColor) {
    final name = vehicalColor.name;
    final asset = 'assets/CarsIcon/$name.png';
    final colorName = vehicalColor.name.capitalize;
    return Tuple(asset, colorName);
  }

  Tuple<String, String> getMotorbikeParam(VehicleColor vehicalColor) {
    final name = vehicalColor.name;
    final asset = 'assets/motorbike_icon/$name.png';
    final colorName = vehicalColor.name.capitalize;
    return Tuple(asset, colorName);
  }
}

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}
