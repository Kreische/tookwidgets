import 'package:flutter/material.dart';

import '../../../took_widgets.dart';
import '../../plugin_consts/plugin_asset_strings.dart';

part '../../extensions/vehicle_extentions.dart';

enum VehicleColor {
  white,
  red,
  green,
  yellow,
  black,
  orange,
  brown,
  purple,
  pink,
  silver,
  lightBlue,
  darkBlue,
  darkGrey,
  lightGreen,
}
enum VehicleFuelType {
  electric,
  pluginHybrid,
  hybrid,
  naturalGas,
  hydrogen,
  petrol,
  diesel
}

enum VehicleType {
  biCycle,
  rikshaw,
  motorbike,
  car,
}
enum VehicleCategory { private, taxi }

enum VehicleBodyType { sedan, hatchback, suv, minivan, van }

extension VehicleExt on VehicleColor {
  Color get color {
    switch (this) {
      case VehicleColor.white:
        return Colors.white;
      case VehicleColor.brown:
        return Colors.brown;
      case VehicleColor.red:
        return Colors.red;
      case VehicleColor.green:
        return Colors.green;
      case VehicleColor.black:
        return Colors.black;
      case VehicleColor.orange:
        return Colors.orange;
      case VehicleColor.purple:
        return Colors.purple;
      case VehicleColor.pink:
        return Colors.pink;
      case VehicleColor.silver:
        return const Color(0xFFC0C0C0);
      case VehicleColor.lightBlue:
        return Colors.lightBlue;
      case VehicleColor.darkBlue:
        return const Color(0xFF00008b);
      case VehicleColor.darkGrey:
        return const Color(0xFFA9A9A9);
      case VehicleColor.lightGreen:
        return Colors.lightGreen;
      case VehicleColor.yellow:
        return Colors.yellow;
      default:
        return Colors.white;
    }
  }

  String get image {
    switch (this) {
      case VehicleColor.white:
        return CarAssetString.white;
      case VehicleColor.brown:
        return CarAssetString.brown;
      case VehicleColor.red:
        return CarAssetString.red;
      case VehicleColor.green:
        return CarAssetString.green;
      case VehicleColor.black:
        return CarAssetString.black;
      case VehicleColor.orange:
        return CarAssetString.orange;
      case VehicleColor.purple:
        return CarAssetString.purple;
      case VehicleColor.pink:
        return CarAssetString.pink;
      case VehicleColor.silver:
        return CarAssetString.silver;
      case VehicleColor.lightBlue:
        return CarAssetString.lightBlue;
      case VehicleColor.darkBlue:
        return CarAssetString.darkBlue;
      case VehicleColor.darkGrey:
        return CarAssetString.darkGrey;
      case VehicleColor.lightGreen:
        return CarAssetString.lightGreen;
      case VehicleColor.yellow:
        return CarAssetString.yellow;
      default:
        return CarAssetString.white;
    }
  }
}
