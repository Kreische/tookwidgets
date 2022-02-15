part of '../models/enums/vehicle_enums.dart';

extension VehicleCategoryExtension on VehicleCategory {
  String? get getString {
    switch (this) {
      case VehicleCategory.private:
        return 'Private';
      case VehicleCategory.taxi:
        return 'taxi';
      default:
        return 'Private';
    }
  }
}

extension VehicleTypeExtention on VehicleType {
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
    switch (this) {
      case VehicleColor.white:
        return Tuple(
          CarAssetString.white,
          'White', //text
        );
      case VehicleColor.brown:
        return Tuple(
          CarAssetString.brown,
          'Brown',
        );
      case VehicleColor.red:
        return Tuple(
          CarAssetString.red,
          'Red',
        );
      case VehicleColor.green:
        return Tuple(
          CarAssetString.green,
          'Green',
        );
      case VehicleColor.black:
        return Tuple(
          CarAssetString.black,
          'Black',
        );
      case VehicleColor.orange:
        return Tuple(
          CarAssetString.orange,
          'Orange',
        );
      case VehicleColor.purple:
        return Tuple(
          CarAssetString.purple,
          'Purple',
        );
      case VehicleColor.pink:
        return Tuple(
          CarAssetString.pink,
          'Pink',
        );
      case VehicleColor.silver:
        return Tuple(
          CarAssetString.silver,
          'Silver',
        );
      case VehicleColor.lightBlue:
        return Tuple(
          CarAssetString.lightBlue,
          'Ligh Blue',
        );
      case VehicleColor.darkBlue:
        return Tuple(
          CarAssetString.darkBlue,
          'Dark Blue',
        );
      case VehicleColor.darkGrey:
        return Tuple(
          CarAssetString.darkGrey,
          'Dark Grey',
        );
      case VehicleColor.lightGreen:
        return Tuple(
          CarAssetString.lightGreen,
          'Ligh Green',
        );
      case VehicleColor.yellow:
        return Tuple(
          CarAssetString.yellow,
          'Yellow',
        );
      default:
        return Tuple(CarAssetString.white, 'White');
    }
  }

  Tuple<String, String> getMotorbikeParam(VehicleColor vehicalColor) {
    switch (this) {
      case VehicleColor.white:
        return Tuple(
          MotorbikeAssetString.white,
          'White', //text
        );
      case VehicleColor.brown:
        return Tuple(
          MotorbikeAssetString.brown,
          'Brown',
        );
      case VehicleColor.red:
        return Tuple(
          MotorbikeAssetString.red,
          'Red',
        );
      case VehicleColor.green:
        return Tuple(
          MotorbikeAssetString.green,
          'Green',
        );
      case VehicleColor.black:
        return Tuple(
          MotorbikeAssetString.black,
          'Black',
        );
      case VehicleColor.orange:
        return Tuple(
          MotorbikeAssetString.orange,
          'Orange',
        );
      case VehicleColor.purple:
        return Tuple(
          MotorbikeAssetString.purple,
          'Purple',
        );
      case VehicleColor.pink:
        return Tuple(
          MotorbikeAssetString.pink,
          'Pink',
        );
      case VehicleColor.silver:
        return Tuple(
          MotorbikeAssetString.silver,
          'Silver',
        );
      case VehicleColor.lightBlue:
        return Tuple(
          MotorbikeAssetString.lightBlue,
          'Ligh Blue',
        );
      case VehicleColor.darkBlue:
        return Tuple(
          MotorbikeAssetString.darkBlue,
          'Dark Blue',
        );
      case VehicleColor.darkGrey:
        return Tuple(
          MotorbikeAssetString.darkGrey,
          'Dark Grey',
        );
      case VehicleColor.lightGreen:
        return Tuple(
          MotorbikeAssetString.lightGreen,
          'Ligh Green',
        );
      case VehicleColor.yellow:
        return Tuple(
          MotorbikeAssetString.yellow,
          'Yellow',
        );
      default:
        return Tuple(MotorbikeAssetString.white, 'White');
    }
  }
}
