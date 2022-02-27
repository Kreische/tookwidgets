import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:tookwidgets/src/models/device_info.dart';

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
    return null;
  }
}
