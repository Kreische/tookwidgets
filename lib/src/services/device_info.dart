import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tookwidgets/src/models/device_info.dart';

mixin DeviceInfoService {
  static Future<DeviceInfo?> get() async {
    final infoService = DeviceInfoPlugin();
    final fcm = await FirebaseMessaging.instance.getToken();
    if (Platform.isAndroid) {
      final info = await infoService.androidInfo;
      return DeviceInfo.android(info).copyWith(fcm: fcm);
    }
    if (Platform.isIOS) {
      final info = await infoService.iosInfo;
      return DeviceInfo.ios(info).copyWith(fcm: fcm);
    }
    return null;
  }
}
