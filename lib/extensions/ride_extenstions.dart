part of '../models/enums/ride_enums.dart';

extension RideStatusExtension on RideStatus {
  String get getString {
    switch (this) {
      case RideStatus.waiting:
        return PluginStringData.awaitingDriverConfirmation;
      case RideStatus.confirmed:
        return PluginStringData.bookingConfirmed;
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
