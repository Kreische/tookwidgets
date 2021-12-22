import 'package:tookwidgets/models/enums/passenger_enums.dart';
import 'package:tookwidgets/plugin_consts/plugin_string_data.dart';

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
}
