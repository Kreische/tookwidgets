import 'package:tookwidgets/src/plugin_consts/plugin_string_data.dart';

enum RideStatus {
  waiting,
  confirmed,
  driverOnTheyWay,
  driverIsHere,
  onTheyWayToPointB,
  onTheyWayToPointC,
  onTheyWayToPointD,
  completed
}

extension RideStatusExtension on RideStatus {
  RideStatus next(int directionsLength) {
    switch (this) {
      case RideStatus.waiting:
        return RideStatus.confirmed;
      case RideStatus.confirmed:
        return RideStatus.driverOnTheyWay;
      case RideStatus.driverOnTheyWay:
        return RideStatus.driverIsHere;
      case RideStatus.driverIsHere:
        return RideStatus.onTheyWayToPointB;
      case RideStatus.onTheyWayToPointB:
        if (directionsLength > 1) return RideStatus.onTheyWayToPointC;
        return RideStatus.completed;

      case RideStatus.onTheyWayToPointC:
        if (directionsLength > 2) return RideStatus.onTheyWayToPointD;
        return RideStatus.completed;

      case RideStatus.onTheyWayToPointD:
        return RideStatus.completed;

      default:
        return RideStatus.onTheyWayToPointB;
    }
  }

  RideStatus previous(int directionsLength) {
    switch (this) {
      // case RideStatus.waiting:
      //   return PluginStringData.awaitingDriverConfirmation;
      case RideStatus.confirmed:
        return RideStatus.waiting;
      case RideStatus.driverOnTheyWay:
        return RideStatus.confirmed;
      case RideStatus.driverIsHere:
        return RideStatus.driverOnTheyWay;
      case RideStatus.onTheyWayToPointB:
        return RideStatus.driverOnTheyWay;
      case RideStatus.onTheyWayToPointC:
        return RideStatus.onTheyWayToPointB;
      case RideStatus.onTheyWayToPointD:
        return RideStatus.onTheyWayToPointC;
      case RideStatus.completed:
        return RideStatus.onTheyWayToPointB;
      default:
        return RideStatus.driverOnTheyWay;
    }
  }

  String get getString {
    switch (this) {
      case RideStatus.waiting:
        return PluginStringData.awaitingDriverConfirmation;
      case RideStatus.confirmed:
        return PluginStringData.awaitingStart;
      case RideStatus.driverOnTheyWay:
        return PluginStringData.driverOnTheyWay;
      case RideStatus.driverIsHere:
        return PluginStringData.yourDriverIsHere;
      case RideStatus.onTheyWayToPointB:
        return 'On the way to point B';
      case RideStatus.onTheyWayToPointC:
        return 'On the way to point C';
      case RideStatus.onTheyWayToPointD:
        return 'On the way to point D';
      case RideStatus.completed:
        return PluginStringData.thanksForChoosingTook;
      default:
        return PluginStringData.awaitingOffer;
    }
  }
}
