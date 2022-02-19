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
  car,
  motorbike,
}
enum VehicleCategory { private, taxi }

enum VehicleBodyType { sedan, hatchback, suv, minivan, van }

extension VehicleExt on VehicleColor {
  Color get color {}
}
