import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:tookwidgets/Models/DeviceInfo.dart';

mixin DeviceInfoService {
  static Future<DeviceInfo?> get() async {
    final infoService = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await infoService.androidInfo;
      return DeviceInfo.android(info);
    }
    if (Platform.isIOS) {
      final info = await infoService.iosInfo;
      return DeviceInfo.ios(info);
    }
  }
}
