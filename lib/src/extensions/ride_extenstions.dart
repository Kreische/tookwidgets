part of '../models/enums/ride_enums.dart';

extension RideStatusExtension on RideStatus {
  RideStatus get next {
    switch (this) {
      case RideStatus.waiting:
        return RideStatus.confirmed;
      case RideStatus.confirmed:
        return RideStatus.driverOnTheyWay;
      case RideStatus.driverOnTheyWay:
        return RideStatus.onTheyWayToPointB;
      case RideStatus.driverIsHere:
        return RideStatus.onTheyWayToPointB;
      case RideStatus.onTheyWayToPointB:
        return RideStatus.completed;
      default:
        return RideStatus.onTheyWayToPointB;
    }
  }

  RideStatus get previous {
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
        return PluginStringData.onTheyWayToPointB;
      case RideStatus.completed:
        return PluginStringData.thanksForChoosingTook;
      default:
        return PluginStringData.awaitingOffer;
    }
  }
}
