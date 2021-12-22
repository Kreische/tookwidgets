import 'package:tookwidgets/models/enums/ride_enums.dart';
import 'package:tookwidgets/plugin_consts/plugin_string_data.dart';

extension RideStatusExtension on RideStatus {
  String get getString {
    switch (this) {
      case RideStatus.waiting:
        return PluginStringData.awaitingDriverConfirmation;
      case RideStatus.driverOnTheyWay:
        return PluginStringData.driverOnTheyWay;
      case RideStatus.driverIsHere:
        return PluginStringData.yourDriverIsHere;
      case RideStatus.onTheyWayToPointB:
        return PluginStringData.onTheyWayToPointB;
      case RideStatus.completed:
        return PluginStringData.thanksForChoosingTook;
      default:
        return PluginStringData.awaitingOffer;
    }
  }
}
