part of '../models/enums/passenger_enums.dart';

extension PassengerSocialExt on PassengerSocial {
  String get getString {
    switch (this) {
      case PassengerSocial.iLikeToChat:
        return PluginStringData.iLikeToChat;
      case PassengerSocial.eitherWay:
        return PluginStringData.eitherWay;
      case PassengerSocial.iLikeQuiteRide:
        return PluginStringData.iLikeQuiteRide;
      default:
        return PluginStringData.iLikeQuiteRide;
    }
  }

  PassengerSocial get next {
    switch (this) {
      case PassengerSocial.iLikeToChat:
        return PassengerSocial.eitherWay;
      case PassengerSocial.eitherWay:
        return PassengerSocial.iLikeQuiteRide;
      case PassengerSocial.iLikeQuiteRide:
        return PassengerSocial.iLikeToChat;
      default:
        return PassengerSocial.eitherWay;
    }
  }
}
